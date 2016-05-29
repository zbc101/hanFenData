//
//  loanApplyViewController.m
//  hanFenData
//
//  Created by zhangbaochuan on 16/5/16.
//  Copyright © 2016年 zbc. All rights reserved.
//

#import "loanApplyViewController.h"
#import "RapidLoanApplyCell.h"
#import "GetMoneyViewController.h"

@interface loanApplyViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation loanApplyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"借款申请信息";
    self.automaticallyAdjustsScrollViewInsets = NO;
    _tableviewLoanApply.separatorStyle = UITableViewCellSeparatorStyleNone;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    RapidLoanApplyCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellpadi"];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"RapidLoanApplyCell" owner:self options:nil] lastObject];
    }
    [cell.btnApplay setTitle:@"申请提款" forState:UIControlStateNormal];
    [cell.btnApplay addTarget:self action:@selector(butClick:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 160.f;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 48.f;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] init];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(16, 0, 200, 48)];
    label.text = @"申请状态：审核中";
    label.font = [UIFont systemFontOfSize:15];
    label.textColor = RGBColor(151, 151, 151);
    [view addSubview:label];
    UILabel *dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(216, 0, _k_w - 216- 16, 48)];
    dateLabel.text = @"昨天";
    dateLabel.textColor = RGBColor(151, 151, 151);
    dateLabel.textAlignment = NSTextAlignmentRight;
    dateLabel.font = [UIFont systemFontOfSize:15];
    [view addSubview:dateLabel];
    return view;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}


-(void)butClick:(UIButton *)btn
{
    GetMoneyViewController *withDraVC = [GetMoneyViewController new];
    [self.navigationController pushViewController:withDraVC animated:YES];
}

@end
