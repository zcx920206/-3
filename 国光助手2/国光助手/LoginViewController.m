//
//  LoginViewController.m
//  国光助手
//
//  Created by 赵楚欣 on 15/12/15.
//  Copyright © 2015年 zhaochuxin. All rights reserved.
//

#import "LoginViewController.h"
#import "SecretViewController.h"
#import "Reachability.h"
#import "FMDatabase.h"
#import "UIImageView+WebCache.h"
#import "AFNetworking.h"
#import <CommonCrypto/CommonDigest.h>
#import "MainViewController.h"
@interface LoginViewController ()
- (IBAction)pushbtn:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *username;
@property (strong, nonatomic) IBOutlet UITextField *pwd;
@property (nonatomic,strong) NSMutableArray *newsArr;
@property (nonatomic,strong) NSOperationQueue *queue;
@property (nonatomic,strong) FMDatabase *db;
@property (nonatomic,copy) NSString *path;//保存沙盒路径
@property (nonatomic,copy) NSString *login_token;
@property (nonatomic,copy) NSString *loginStatusCode;
@property (nonatomic,copy) NSString *login_userid;
@property (nonatomic,copy) NSString *login_userName;
@property (strong, nonatomic) IBOutlet UISwitch *switchbtn;
@end
@implementation LoginViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self createDb];
    Reachability *internet=[Reachability reachabilityForInternetConnection];
    NetworkStatus internetStatus=[internet currentReachabilityStatus];//获取上网状态
    
    Reachability *wifi=[Reachability reachabilityForLocalWiFi];
    NetworkStatus wifiStatus=[wifi currentReachabilityStatus];
    
    if ((internetStatus==ReachableViaWWAN)||(wifiStatus==ReachableViaWiFi)) {//
        self.queue=[[NSOperationQueue alloc] init];
    }
    
    // Do any additional setup after loading the view from its nib.
    
}
-(void)createDb
{
    NSString *path=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    self.path=path;
    
    path=[path stringByAppendingPathComponent:@"wnlo.sqlite"];
    NSLog(@"%@",path);
    self.db=[FMDatabase databaseWithPath:path];
    if([self.db open])
    {
        NSString *table=@"create table if not exists wnlo(nid integer primary key  not null,token text,userId integer,userName text)";
        [self.db executeUpdate:table];
        NSString *table2=@"create table if not exists login(nid integer primary key  not null,loginstatus integer)";
        [self.db executeUpdate:table2];
        [self.db executeUpdate:@"insert into login (nid,loginstatus) values(?,?)",@1,@1];
        [self.db executeUpdate:@"insert into wnlo (nid,token,userId,userName) values(?,?,?,?)",@1,NULL,@1,NULL];
            
        

        
        
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

- (IBAction)pushbtn:(id)sender {

    
    if([self.db open]){
        NSString *update1 = [NSString stringWithFormat:@"UPDATE login SET '%@' = '%d' WHERE nid =1",@"loginstatus",[self.switchbtn isOn]];
        [self.db executeUpdate:update1];
    }
    
    [self transportdata];
    
}
-(void)transportdata{
    AFHTTPRequestOperationManager *mgr=[AFHTTPRequestOperationManager manager];
    NSDictionary *params = @{
                             @"loginName":self.username.text,
                             @"pwd":[self md5:self.pwd.text],
                             @"clientType":@2
                             };
    [mgr POST:@"http://121.42.32.217:8080/ams/login/" parameters:params success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        NSLog(@"请求成功---%@", responseObject);
        self.loginStatusCode=[responseObject valueForKey:@"statusCode"];
        responseObject=[responseObject valueForKey:@"result"];
        self.login_token=[responseObject valueForKey:@"token"];
        self.login_userid=[responseObject valueForKey:@"userId"];
        self.login_userName=[responseObject valueForKey:@"userName"];        
        if([self.loginStatusCode isEqualToString:@"100"])
        {
            SecretViewController *secret=[[SecretViewController alloc]init];
            secret.userId=self.login_userid;
            secret.oldpwd=self.pwd.text;
            [self.navigationController pushViewController:secret animated:YES];
        }
        else if([self.loginStatusCode isEqualToString:@"200"])
        {
            if([self.db open])
            {
                NSString *update1 = [NSString stringWithFormat:@"UPDATE wnlo SET '%@' = '%@' WHERE nid=1",@"token",self.login_token];
                [self.db executeUpdate:update1];
                NSString *update2 = [NSString stringWithFormat:@"UPDATE wnlo SET '%@' = '%d' WHERE nid=1",@"userId",[self.login_userid intValue]];
                [self.db executeUpdate:update2];
                NSString *update3 = [NSString stringWithFormat:@"UPDATE wnlo SET '%@' = '%@' WHERE nid=1",@"userName",self.login_userName];
                [self.db executeUpdate:update3];
               
            }
            MainViewController *mainer=[[MainViewController alloc]init];
            [self.navigationController pushViewController:mainer animated:YES];
            
            
        }
        else if([self.loginStatusCode isEqualToString:@"300"])
        {
            UIAlertView *aler=[[UIAlertView alloc]initWithTitle:nil message:nil delegate:self cancelButtonTitle:nil otherButtonTitles:@"用户名或密码错误",nil];
            
            [aler show];

        }

        
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        NSLog(@"请求失败---%@", error);
        
    }];
    
    
    
}
- (NSString *)md5:(NSString *)str
{
    const char *cStr = [str UTF8String];
    unsigned char result[16];
    CC_MD5(cStr, (int)strlen(cStr), result); // This is the md5 call
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}
@end
