//
//  applyViewController.m
//  国光助手
//
//  Created by 文可 on 16/1/20.
//  Copyright © 2016年 zhaochuxin. All rights reserved.
//

#import "applyViewController.h"
#import "DropDownList.h"

@interface applyViewController ()
- (IBAction)popbtn:(id)sender;


@end

@implementation applyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    DropDownList *dd1 = [[DropDownList alloc] initWithFrame:CGRectMake(125, 284, 140, 21)];
    dd1.textField.placeholder = @"请输入申请主题";
    NSArray* arr=[[NSArray alloc]initWithObjects:@"请假",@"aaa",@"bbb",nil];
    dd1.list = arr;
    [self.view addSubview:dd1];

}



- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
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




@end
