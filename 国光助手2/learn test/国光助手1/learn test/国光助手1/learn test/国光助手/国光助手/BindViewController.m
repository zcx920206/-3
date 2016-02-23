//
//  BindViewController.m
//  国光助手
//
//  Created by 赵楚欣 on 15/12/15.
//  Copyright © 2015年 zhaochuxin. All rights reserved.
//

#import "BindViewController.h"
#import "SecretViewController.h"
@interface BindViewController ()
- (IBAction)popbtn:(id)sender;
- (IBAction)pushbtn:(id)sender;

@end

@implementation BindViewController

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

- (IBAction)popbtn:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
    
    
}

- (IBAction)pushbtn:(id)sender {
    SecretViewController *vc=[[SecretViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
