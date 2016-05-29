//
//  DetailSelfInfoViewController.m
//  hanFenData
//
//  Created by zhangbaochuan on 16/5/18.
//  Copyright © 2016年 zbc. All rights reserved.
//

#import "DetailSelfInfoViewController.h"
#import "FixInfoPerfectIdentityViewController.h"

@interface DetailSelfInfoViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) NSArray *titleArr;

@end

@implementation DetailSelfInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"个人详细资料";
    self.automaticallyAdjustsScrollViewInsets = NO;
    _titleArr = @[@"姓名",@"身份证号",@"联系手机号"
                  ,@"学历",@"住址",@"工作信息",@"单位地址"];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _titleArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellString = @"cll";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellString];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellString];
    }
    cell.textLabel.text = _titleArr[indexPath.row];
    cell.detailTextLabel.text = @"未填写";
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 48.f;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 48.f;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc] init];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(16, 0, 100, 48)];
    label.text = @"基础信息";
    label.font = [UIFont systemFontOfSize:15];
    label.textColor = RGBColor(149, 149, 149);
    [view addSubview:label];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(_k_w -100, 4, 40, 40);
    [btn setImage:[UIImage imageNamed:@"03_tie_03_icon08"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:btn];
    
    UILabel *textLabel  = [[UILabel alloc] initWithFrame:CGRectMake(_k_w - 60, 0, 40, 48)];
    textLabel.text = @"编辑";
    textLabel.textColor = RGBColor(229, 175, 86);
    [view addSubview:textLabel];
    
    return view;
}
-(void)btnClick:(UIButton *)btn
{
    FixInfoPerfectIdentityViewController *feixVC = [FixInfoPerfectIdentityViewController new];
    [self.navigationController pushViewController:feixVC animated:YES];
}

@end
