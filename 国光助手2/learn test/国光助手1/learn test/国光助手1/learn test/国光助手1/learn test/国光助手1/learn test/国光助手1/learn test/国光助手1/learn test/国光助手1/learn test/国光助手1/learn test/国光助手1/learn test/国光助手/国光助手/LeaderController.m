//
//  LeaderController.m
//  国光助手
//
//  Created by 赵楚欣 on 15/12/15.
//  Copyright © 2015年 zhaochuxin. All rights reserved.
//

#import "LeaderController.h"
#import "LoginViewController.h"
@interface LeaderController ()
@property(nonatomic,strong)UIScrollView *scroll;
@end

@implementation LeaderController

- (void)viewDidLoad {
    [super viewDidLoad];
    _scroll=[[UIScrollView alloc]initWithFrame:CGRectMake(0,0,self.view.frame.size.width, self.view.frame.size.height)];
    _scroll.scrollEnabled=YES;
    _scroll.contentSize=CGSizeMake(self.view.frame.size.width*5, self.view.frame.size.height);
    _scroll.showsHorizontalScrollIndicator=NO;
    _scroll.showsVerticalScrollIndicator=NO;
    [self scrollview];
    [self.view addSubview:_scroll];

    // Do any additional setup after loading the view.
}

-(void)scrollview
{
    NSArray *imageArr=[NSArray arrayWithObjects:[UIImage imageNamed:@"1.png"],[UIImage imageNamed:@"2.png"],[UIImage imageNamed:@"3.png"],[UIImage imageNamed:@"4.png"],[UIImage imageNamed:@"5.png"],nil];
    for (int i=0; i<imageArr.count; i++) {
        UIImageView *imageview=[[UIImageView alloc]initWithFrame:CGRectMake(i*self.view.frame.size.width,0 , self.view.frame.size.width, self.view.frame.size.height)];
        [imageview setImage:imageArr[i]];
        imageview.userInteractionEnabled=YES;//使图片可以点击
        if(i==4)
        {
            UIButton *button=[[UIButton alloc]initWithFrame:CGRectMake(110, 205, 160, 50)];
            
            button.backgroundColor=[UIColor blueColor];
            [button setTitle:@"点击进入" forState:UIControlStateNormal];
            button.layer.cornerRadius=10;
            button.alpha=0.5;
            [button addTarget:self action:@selector(touche:) forControlEvents:UIControlEventTouchUpInside];
            [imageview addSubview:button];
            
        }
        [_scroll addSubview:imageview];
    }
    
    
}
-(void)touche:(UIButton*)btn
{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    [defaults setBool:YES forKey:@"ko"];
    [defaults synchronize];//保存
    UIWindow *window=[UIApplication sharedApplication].keyWindow;//获取主窗口
    
    LoginViewController *login=[[LoginViewController alloc]init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:login];
    [nav setNavigationBarHidden:YES];
    window.rootViewController=nav;
    
}
@end
