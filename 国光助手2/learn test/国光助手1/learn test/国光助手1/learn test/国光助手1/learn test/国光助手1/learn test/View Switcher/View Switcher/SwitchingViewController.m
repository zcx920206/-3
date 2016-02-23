//
//  ViewController.m
//  View Switcher
//
//  Created by 文可 on 15/12/24.
//  Copyright © 2015年 ke. All rights reserved.
//

#import "SwitchingViewController.h"

#import "YellowViewController.h"
#import "BlueViewController.h"

@interface SwitchingViewController ()

@property (strong,nonatomic) YellowViewController *yellowViewController;
@property (strong,nonatomic) BlueViewController *blueViewController;

@end

@implementation SwitchingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, ypically from a nib.
    self.blueViewController=[self.storyboard instantiateViewControllerWithIdentifier:@"Blue"];
    self.blueViewController.view.frame=self.view.frame;
    [self switchViews From ViewController:nil
     to ViewController:self.BlueViewController];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)switchViews:(id)sender{

}
@end
