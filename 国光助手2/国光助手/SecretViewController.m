//
//  SecretViewController.m
//  国光助手
//
//  Created by 赵楚欣 on 15/12/16.
//  Copyright © 2015年 zhaochuxin. All rights reserved.
//

#import "SecretViewController.h"
#import "BindViewController.h"
@interface SecretViewController ()
- (IBAction)pushbtn:(id)sender;
- (IBAction)popbtn:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *newpwd;
@property (strong, nonatomic) IBOutlet UITextField *confirmnewpwd;

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
    if ([self.newpwd.text isEqualToString:self.confirmnewpwd.text]) {
        BindViewController *bind=[[BindViewController alloc]init];
        bind.oldpwd=self.oldpwd;
        bind.newpwd=self.newpwd.text;
        bind.userId=self.userId;
        [self.navigationController pushViewController:bind animated:YES];
    }
    else{
        UIAlertView *aler=[[UIAlertView alloc]initWithTitle:nil message:nil delegate:self cancelButtonTitle:nil otherButtonTitles:@"两次密码不匹配",nil];
        
        [aler show];
        
    }

}

- (IBAction)popbtn:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
