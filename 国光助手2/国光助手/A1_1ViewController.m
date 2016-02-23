//
//  A1_1ViewController.m
//  国光助手
//
//  Created by 文可 on 16/1/19.
//  Copyright © 2016年 zhaochuxin. All rights reserved.
//

#import "A1_1ViewController.h"

@interface A1_1ViewController ()
//@property (strong, nonatomic) IBOutlet UIView *view1;
- (IBAction)popbtn:(id)sender;
@end

@implementation A1_1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
   // _view1.layer.borderWidth=1;
  //  _view1.layer.borderColor=[[UIColor blueColor] CGColor];
    
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
