//
//  WorkCheckViewController.m
//  国光助手
//
//  Created by 文可 on 16/1/10.
//  Copyright © 2016年 zhaochuxin. All rights reserved.
//

#import "WorkCheckViewController.h"

@interface WorkCheckViewController ()
@property (strong, nonatomic) IBOutlet UILabel *time;
@property (strong, nonatomic) IBOutlet UILabel *week;

@end

@implementation WorkCheckViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    // Do any additional setup after loading the view from its nib.
    NSDate *date=[NSDate date];//获取当前时间
    NSDateFormatter *format1=[[NSDateFormatter alloc]init];
    [format1 setDateFormat:@"yyyy年MM月dd日"];
    NSString *str1=[format1 stringFromDate:date];
    self.time.text = str1;
    
    NSDateComponents *componets = [[NSCalendar autoupdatingCurrentCalendar] components:NSWeekdayCalendarUnit fromDate:[NSDate date]];
    int weekday = [componets weekday];
    NSString *str2;
    switch(weekday) {
        case 2:str2=@"星期一";break;
        case 3:str2=@"星期二";break;
        case 4:str2=@"星期三";break;
        case 5:str2=@"星期四";break;
        case 6:str2=@"星期五";break;
        case 7:str2=@"星期六";break;
        case 1:str2=@"星期天";break;
    }
    self.week.text=str2;

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
