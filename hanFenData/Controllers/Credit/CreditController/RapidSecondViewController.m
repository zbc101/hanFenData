//
//  RapidSecondViewController.m
//  hanFenData
//
//  Created by zhangbaochuan on 16/5/13.
//  Copyright © 2016年 zbc. All rights reserved.
//

#import "RapidSecondViewController.h"
#import "PaidLoanCell.h"
#import "FaxinDaiViewController.h"

@interface RapidSecondViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation RapidSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _tableviewrapid.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.navigationItem.title = @"急速借款";
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectio{
    return 2;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    PaidLoanCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellpadi"];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"PaidLoanCell" owner:self options:nil] lastObject];
    }
    [cell.btnApply addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 180.f;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 48.f;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] init];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(16, 0, _k_w-16, 48)];
    label.text = @"根据您的需求，为您提供如下平台";
    label.font = [UIFont systemFontOfSize:15];
    label.textColor = RGBColor(151, 151, 151);
    [view addSubview:label];
    return view;
}

-(void)btnClick:(UIButton *)btn
{
    FaxinDaiViewController *faxindaiVC = [FaxinDaiViewController new];
    [self.navigationController pushViewController:faxindaiVC animated:YES];

}
@end
