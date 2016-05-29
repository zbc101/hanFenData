//
//  MyBandcardsViewController.m
//  hanFenData
//
//  Created by zhangbaochuan on 16/5/18.
//  Copyright © 2016年 zbc. All rights reserved.
//

#import "MyBandcardsViewController.h"
#import "MyBankCardsCell.h"
#import "MinelistCell.h"
#import "AddMyBankCardViewController.h"

@interface MyBandcardsViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation MyBandcardsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"我的银行卡";
    self.automaticallyAdjustsScrollViewInsets = NO;
    
}


-(void)viewWillAppear:(BOOL)animated{
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
    MyBankCardsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyBankCardsCell"];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"MyBankCardsCell" owner:self options:nil] lastObject];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (indexPath.section == 1) {
        MinelistCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MinelistCell"];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"MinelistCell" owner:self options:nil] lastObject];
        }
        cell.imageviewicon.image = [UIImage imageNamed:@"03_tie_03_icon05"];
        cell.labelTitle.text = @"添加银行卡";
        cell.viewButton.hidden = YES;
        cell.lableDetailTitle.hidden = YES;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 1) {
        return 48.f;
    }
    return 100.f;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 1) {
        return 16.f;
    }
    return 8.f;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == 1) {
        return 0.1f;
    }
    return 8.1f;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 1) {
        AddMyBankCardViewController *addMybankVC =[AddMyBankCardViewController new];
        [self.navigationController pushViewController:addMybankVC animated:YES];
    }
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = [UIColor whiteColor];
        return view;
    }
    return nil;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    if (section == 0) {
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = [UIColor whiteColor];
        return view;
    }
    return nil;
}


@end
