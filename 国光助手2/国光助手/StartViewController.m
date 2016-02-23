//
//  StartViewController.m
//  国光助手
//
//  Created by 赵楚欣 on 16/2/7.
//  Copyright © 2016年 zhaochuxin. All rights reserved.
//

#import "StartViewController.h"
#import "LoginViewController.h"
#import "FMDatabase.h"
#import "MainViewController.h"
#import "AFNetworking.h"
static int userid = 0;
static int loginstatus=0;
@interface StartViewController ()
@property (nonatomic,strong) FMDatabase *db;
@property(nonatomic,strong)NSString *token;
@property(nonatomic,strong)NSString *statusCode;

@end

@implementation StartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSString *path=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    path=[path stringByAppendingPathComponent:@"wnlo.sqlite"];
    self.db=[FMDatabase databaseWithPath:path];
    NSLog(@"%@",path);
    if ([self.db open]) {
        NSString * sql = [NSString stringWithFormat:
                          @"SELECT * FROM %@",@"wnlo"];
        FMResultSet * rs = [self.db executeQuery:sql];
        while ([rs next]) {
            self.token = [rs stringForColumn:@"token"];
            userid=[rs intForColumn:@"userId"];
        }
        [self.db close];
    }
    if ([self.db open]) {
        NSString * sql2 = [NSString stringWithFormat:
                           @"SELECT * FROM %@",@"login"];
        FMResultSet * rs2 = [self.db executeQuery:sql2];
        while ([rs2 next]) {
            loginstatus = [rs2 intForColumn:@"loginstatus"];
        }
        [self.db close];
    }
    AFHTTPRequestOperationManager *mgr=[AFHTTPRequestOperationManager manager];
    NSDictionary *params = @{
                             @"w":[NSNumber numberWithInt:userid],
                             @"n":@2,
                             @"l":self.token
                             };
    [mgr POST:@"http://121.42.32.217:8080/ams/login/tk" parameters:params success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        NSLog(@"success");
        self.statusCode=[responseObject valueForKey:@"statusCode"];
        NSLog(@"statuscode%@",self.statusCode);
        if([self.statusCode isEqualToString:@"200"]&&loginstatus==1)
        {
            MainViewController *mainer=[[MainViewController alloc]init];
            [self.navigationController pushViewController:mainer animated:YES];
        }
        else{
        LoginViewController *login=[[LoginViewController alloc]init];
        [self.navigationController pushViewController:login animated:YES];
        }
        
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        NSLog(@"error");
        LoginViewController *login=[[LoginViewController alloc]init];
        [self.navigationController pushViewController:login animated:YES];
    }];
    //NSLog(@"statuscode%@,loginstatus%d",self.statusCode,loginstatus);
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

@end
