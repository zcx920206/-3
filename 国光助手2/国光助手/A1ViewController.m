//
//  A1ViewController.m
//  国光助手
//
//  Created by 文可 on 16/1/10.
//  Copyright © 2016年 zhaochuxin. All rights reserved.
//

#import "A1ViewController.h"
#import "A1_1ViewController.h"
#import "applyViewController.h"
@interface A1ViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (copy,nonatomic) NSArray *dwarves;
- (IBAction)pushbtn:(id)sender;
- (IBAction)popbtn:(id)sender;
@end

@implementation A1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
         self.dwarves=@[@"我需要申请的流程"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dwarves count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *TableIdentifier = @"TableIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:TableIdentifier];
    
    //去掉分割线
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    if (cell == nil) {
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:TableIdentifier];
    }
    cell.textLabel.text = self.dwarves[indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.selected = NO;
    if([indexPath row] == 0)
    {
        A1_1ViewController *a1 = [[A1_1ViewController alloc]init];
        [self.navigationController pushViewController:a1 animated:YES];
    }
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

- (IBAction)pushbtn:(id)sender {
    applyViewController *a2 = [[applyViewController alloc]init];
    [self.navigationController pushViewController:a2 animated:YES];
}
@end
