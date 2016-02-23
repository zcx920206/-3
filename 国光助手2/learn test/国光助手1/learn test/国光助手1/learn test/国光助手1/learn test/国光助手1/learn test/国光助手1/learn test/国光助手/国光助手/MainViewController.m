//
//  MainViewController.m
//  国光助手
//
//  Created by 赵楚欣 on 15/12/16.
//  Copyright © 2015年 zhaochuxin. All rights reserved.
//

#import "MainViewController.h"
#import "ApprovalViewController.h"
#import "SignViewController.h"
#import "WorkCheckViewController.h"

@interface MainViewController ()
- (IBAction)poprootbtn:(id)sender;
- (IBAction)Examinebtn:(id)sender;
- (IBAction)Signbtn:(id)sender;
- (IBAction)checkbtn:(id)sender;


@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

- (IBAction)poprootbtn:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (IBAction)Examinebtn:(id)sender {
    ApprovalViewController *vc=[[ApprovalViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)Signbtn:(id)sender {
    SignViewController *vc=[[SignViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)checkbtn:(id)sender {
    WorkCheckViewController *vc=[[WorkCheckViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
