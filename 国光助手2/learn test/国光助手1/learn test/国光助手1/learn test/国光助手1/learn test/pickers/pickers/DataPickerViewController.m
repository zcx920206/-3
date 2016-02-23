//
//  DataPickerViewController.m
//  pickers
//
//  Created by 文可 on 15/12/31.
//  Copyright © 2015年 ke. All rights reserved.
//

#import "DataPickerViewController.h"

@interface DataPickerViewController ()
@property (weak, nonatomic) IBOutlet UIDatePicker *dataPicker;

@end

@implementation DataPickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSDate *now=[NSDate date];
    [self.dataPicker setDate:now animated:NO];
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
- (IBAction)buttonPressed:(id)sender {
    NSDate *date=self.dataPicker.date;
    NSString *message=[[NSString alloc] initWithFormat:@"The date and time you select is %@",date];
    UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"Data and Time Selected" message:message
                                                          preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action=[UIAlertAction actionWithTitle:@"That is so true!" style:UIAlertViewStyleDefault handler:nil];
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:nil];
    
}


@end
