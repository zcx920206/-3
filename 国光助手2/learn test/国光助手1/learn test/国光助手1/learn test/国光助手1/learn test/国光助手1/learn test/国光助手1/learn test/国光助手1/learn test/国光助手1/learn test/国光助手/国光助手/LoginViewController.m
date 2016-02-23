//
//  LoginViewController.m
//  国光助手
//
//  Created by 赵楚欣 on 15/12/15.
//  Copyright © 2015年 zhaochuxin. All rights reserved.
//

#import "LoginViewController.h"
#import "BindViewController.h"
@interface LoginViewController ()
- (IBAction)pushbtn:(id)sender;

@end

@implementation LoginViewController
- (void)viewDidLoad {
    [super viewDidLoad];
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

- (IBAction)pushbtn:(id)sender {
    
    BindViewController *binder=[[BindViewController alloc]init];
    
    [self.navigationController pushViewController:binder animated:YES];
}
@end
