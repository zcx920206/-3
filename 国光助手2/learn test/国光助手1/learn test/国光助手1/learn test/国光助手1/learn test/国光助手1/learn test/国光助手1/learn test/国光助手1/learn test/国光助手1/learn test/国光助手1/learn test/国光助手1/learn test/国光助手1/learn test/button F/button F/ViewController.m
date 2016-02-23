//
//  ViewController.m
//  button F
//
//  Created by 文可 on 15/12/16.
//  Copyright © 2015年 ke. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *labelstatus;

@end

@implementation ViewController
- (IBAction)buttonpressed:(UIButton *)sender {
    NSString *title=[sender titleForState:UIControlStateNormal];
    NSString *plainText=[NSString stringWithFormat:@"%@ button pressed.",title];
    NSMutableAttributedString *styledText=[[NSMutableAttributedString alloc]initWithString:plainText];
    NSDictionary *attributes=
    @{
      NSFontAttributeName : [UIFont boldSystemFontOfSize:_labelstatus.font.pointSize]
      };
    NSRange nameRange = [plainText rangeOfString:title];
    [styledText setAttributes:attributes range:nameRange];
    _labelstatus.attributedText=styledText;
    
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
