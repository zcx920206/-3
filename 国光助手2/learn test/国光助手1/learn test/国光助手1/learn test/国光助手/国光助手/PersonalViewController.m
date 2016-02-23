//
//  PersonalViewController.m
//  国光助手
//
//  Created by 赵楚欣 on 15/12/16.
//  Copyright © 2015年 zhaochuxin. All rights reserved.
//

#import "PersonalViewController.h"
#import "MainViewController.h"
@interface PersonalViewController ()
- (IBAction)optionalbtn:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *optionbtn;

- (IBAction)pushbtn:(id)sender;
- (IBAction)skipbtn:(id)sender;
- (IBAction)popbtn:(id)sender;

@end

@implementation PersonalViewController

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

- (IBAction)optionalbtn:(id)sender {
    UIAlertView *aler=[[UIAlertView alloc]initWithTitle:nil message:nil delegate:self cancelButtonTitle:nil otherButtonTitles:@"光电子器件与集成功能实验室",@"激光与太赫兹技术功能实验室",@"生物医学光子学功能实验室",@"信息存储与光显示功能实验室",@"能源光电子功能实验室",nil];

    [aler show];
}

- (IBAction)pushbtn:(id)sender {
    MainViewController *vc=[[MainViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)skipbtn:(id)sender {
}

- (IBAction)popbtn:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSArray *arr=[NSArray arrayWithObjects:@"光电子器件与集成功能实验室",@"激光与太赫兹技术功能实验室",@"生物医学光子学功能实验室",@"信息存储与光显示功能实验室",@"能源光电子功能实验室",nil];
    self.optionbtn.titleLabel.text=arr[buttonIndex];
    
}
@end
