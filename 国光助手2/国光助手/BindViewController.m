//
//  BindViewController.m
//  国光助手
//
//  Created by 赵楚欣 on 15/12/15.
//  Copyright © 2015年 zhaochuxin. All rights reserved.
//

#import "BindViewController.h"
#import "PersonalViewController.h"
#import "AFNetworking.h"
#import "FMDatabase.h"
#import <CommonCrypto/CommonDigest.h>
@interface BindViewController ()
- (IBAction)popbtn:(id)sender;
- (IBAction)pushbtn:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *phonenum;
@property (strong, nonatomic) IBOutlet UITextField *comfirmpwd;
- (IBAction)comfirmpwd:(id)sender;
@property (nonatomic,strong) FMDatabase *db;
@property(nonatomic,strong)NSString *login_token;
@property(nonatomic,strong)NSNumber *login_userid;
@property(nonatomic,strong)NSString *login_name;
@end

@implementation BindViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *path=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    path=[path stringByAppendingPathComponent:@"wnlo.sqlite"];
    self.db=[FMDatabase databaseWithPath:path];
    // Do any additional setup after loading the view from its nib.
    // Do any additional setup after loading the view from its nib.
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

- (IBAction)popbtn:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
    
    
}

- (IBAction)pushbtn:(id)sender {
    AFHTTPRequestOperationManager *mgr=[AFHTTPRequestOperationManager manager];
    NSDictionary *params = @{
                             @"pwd":[self md5:self.oldpwd],
                             @"password":[self md5:self.newpwd],
                             @"tel":self.phonenum.text,
                             @"clientType":@2,
                             @"msgCode":self.comfirmpwd.text
                             };
    int userid=[self.userId intValue];
    NSString *intenert=[NSString stringWithFormat:@"http://121.42.32.217:8080/ams/login/active/%d",userid];
    [mgr POST:intenert parameters:params success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        NSLog(@"请求成功---%@", responseObject);
        self.login_token=[[responseObject valueForKey:@"result"] valueForKey:@"token"];
        self.login_userid=[[responseObject valueForKey:@"result"] valueForKey:@"userId"];
        self.login_name=[[responseObject valueForKey:@"result"] valueForKey:@"userName"];
        if([self.db open])
        {
            [self.db executeUpdate:@"insert into wnlo (token,userId,userName) values(?,?,?)",self.login_token,self.login_userid ,self.login_name];
            
        }
        PersonalViewController *vc=[[PersonalViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
        
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        NSLog(@"请求失败---%@", error);
        UIAlertView *aler=[[UIAlertView alloc]initWithTitle:nil message:nil delegate:self cancelButtonTitle:nil otherButtonTitles:@"请求出错",nil];
        
        [aler show];
        
    }];
    
    
    

}
- (IBAction)comfirmpwd:(id)sender {
    AFHTTPRequestOperationManager *mgr=[AFHTTPRequestOperationManager manager];
    NSDictionary *params = @{
                             @"pwd":[self md5:self.oldpwd],
                             @"tel":self.phonenum.text,
                             @"clientType":@2
                             };
    int userid=[self.userId intValue];
    NSLog(@"%d",userid);
    NSString *intenert=[NSString stringWithFormat:@"http://121.42.32.217:8080/ams/login/active/%d/sdmsg",userid];
    [mgr POST:intenert parameters:params success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        NSLog(@"请求成功---%@", responseObject);
        
        NSLog(@"%@",[responseObject valueForKey:@"statusCode"]);
        
        
        
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        NSLog(@"请求失败---%@", error);
        UIAlertView *aler=[[UIAlertView alloc]initWithTitle:nil message:nil delegate:self cancelButtonTitle:nil otherButtonTitles:@"请求出错",nil];
        
        [aler show];
        
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
