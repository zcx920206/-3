//
//  A2ViewController.m
//  国光助手
//
//  Created by 文可 on 16/1/10.
//  Copyright © 2016年 zhaochuxin. All rights reserved.
//

#import "A2ViewController.h"

@interface A2ViewController ()
- (IBAction)popbtn:(id)sender;
@end

@implementation A2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)popbtn:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
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
