//
//  ViewController.m
//  control fun
//
//  Created by 文可 on 15/12/17.
//  Copyright © 2015年 ke. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *numberField;
@property (weak, nonatomic) IBOutlet UILabel *sliderLabel;
@property (weak, nonatomic) IBOutlet UISwitch *leftSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *rightSwitch;
@property (weak, nonatomic) IBOutlet UIButton *doSomethingButton;


@end

@implementation ViewController

- (IBAction)textFieldDoneEditing:(id)sender {
    [sender resignFirstResponder];
}
- (IBAction)backgroundTap:(id)sender{
    [self.nameField resignFirstResponder];
    [self.numberField resignFirstResponder];
}
- (IBAction)sliderChanged:(UISlider *)sender {
    int progress =(int)lround(sender.value);
    self.sliderLabel.text=[NSString stringWithFormat:@"%d",progress];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.sliderLabel.text=@"50";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)switchChanged:(UISwitch *)sender {
    BOOL setting=sender.isOn;
    [self.leftSwitch setOn:setting animated:YES];
    [self.rightSwitch setOn:setting animated:YES];
}
- (IBAction)toggleControls:(UISegmentedControl *)sender {
    if(sender.selectedSegmentIndex==0)
    {
        self.leftSwitch.hidden=NO;
        self.rightSwitch.hidden=NO;
        self.doSomethingButton.hidden=YES;
    }
    else{
        self.leftSwitch.hidden=YES;
        self.rightSwitch.hidden=YES;
        self.doSomethingButton.hidden=NO;
    }
}
- (IBAction)buttonPressed:(UIButton *)sender {
}

@end
