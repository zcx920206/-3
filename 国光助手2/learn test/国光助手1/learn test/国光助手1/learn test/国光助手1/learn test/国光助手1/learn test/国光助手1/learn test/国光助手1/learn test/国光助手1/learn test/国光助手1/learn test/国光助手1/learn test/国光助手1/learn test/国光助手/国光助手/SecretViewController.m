//
//  SecretViewController.m
//  国光助手
//
//  Created by 赵楚欣 on 15/12/16.
//  Copyright © 2015年 zhaochuxin. All rights reserved.
//

#import "SecretViewController.h"
#import "PersonalViewController.h"
@interface SecretViewController ()
- (IBAction)pushbtn:(id)sender;
- (IBAction)popbtn:(id)sender;

@end

@implementation SecretViewController

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
    PersonalViewController *vc=[[PersonalViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)popbtn:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
