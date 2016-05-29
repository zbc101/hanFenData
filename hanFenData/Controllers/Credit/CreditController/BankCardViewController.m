//
//  BankCardViewController.m
//  hanFenData
//
//  Created by zhangbaochuan on 16/5/13.
//  Copyright © 2016年 zbc. All rights reserved.
//

#import "BankCardViewController.h"
#import "BankCardCell.h"
#import "MinelistCell.h"
#import "AddCardCreditViewController.h"
#import "GetEmailBankViewController.h"

@interface BankCardViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation BankCardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"信用卡还款";
    self.navigationController.navigationBarHidden = NO;
    self.automaticallyAdjustsScrollViewInsets = NO;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 1) {
        return 1;
    }
    return 3;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BankCardCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BankCardCell"];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"BankCardCell" owner:self options:nil] lastObject];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell.btnCheckBill addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    if (indexPath.section == 1) {
        MinelistCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MinelistCell"];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"MinelistCell" owner:self options:nil] lastObject];
        }
        cell.imageviewicon.image = [UIImage imageNamed:@"02_home_icon12"];
        cell.labelTitle.text = @"添加银行卡";
        cell.labelTitle.textColor = RGBColor(187, 185, 192);
        cell.viewButton.hidden = YES;
        cell.lableDetailTitle.hidden = YES;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = RGBColor(67, 67, 67);
        return cell;
    }
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 1) {
        return 48.f;
    }
    return 114.f;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.1f;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 8.1f;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 1) {
        AddCardCreditViewController *addMybankVC =[AddCardCreditViewController new];
        self.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:addMybankVC animated:YES];
    }
}

-(void)btnClick:(UIButton *)btn
{
    GetEmailBankViewController *getEmailVC = [GetEmailBankViewController new];
    [self.navigationController pushViewController:getEmailVC animated:YES];
}

@end
