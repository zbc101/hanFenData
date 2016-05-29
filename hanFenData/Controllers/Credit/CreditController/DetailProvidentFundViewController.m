//
//  DetailProvidentFundViewController.m
//  hanFenData
//
//  Created by zhangbaochuan on 16/5/16.
//  Copyright © 2016年 zbc. All rights reserved.
//

#import "DetailProvidentFundViewController.h"
#import "FundDetailCell.h"
#import "FundYearDetailCell.h"
#import "PayMentDetailViewController.h"

@interface DetailProvidentFundViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation DetailProvidentFundViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.navigationItem.title = @"个人公积金记录报告";
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 1) {
        return 4;
    }
    return 1;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 0){
        FundDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FundDetailCell"];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"FundDetailCell" owner:self options:nil] lastObject];
        }
        return cell;
    }
    if (indexPath.section == 1) {
        FundYearDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FundYearDetailCell"];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"FundYearDetailCell" owner:self options:nil] lastObject];
        }
        return cell;
    }
    
    return nil;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 1) {
        return 48.f;
    }
    return 210.f;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 48.f;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] init];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(16, 8, 200, 40)];
    label.text = @"积分明细";
    label.font = [UIFont systemFontOfSize:15];
    label.textColor = RGBColor(151, 151, 151);
    [view addSubview:label];
    return view;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    PayMentDetailViewController *payVC = [PayMentDetailViewController new];
    [self.navigationController pushViewController:payVC animated:YES];
}



@end
