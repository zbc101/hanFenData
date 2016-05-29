//
//  MyBillViewController.m
//  hanFenData
//
//  Created by zhangbaochuan on 16/5/16.
//  Copyright © 2016年 zbc. All rights reserved.
//

#import "MyBillViewController.h"
#import "MyBillButtonBTnCell.h"
#import "MyBillIconCell.h"
#import "MybillTitleCell.h"
#import "MyBillDetailCell.h"

@interface MyBillViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation MyBillViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.navigationItem.title = @"我的账单";
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 2) {
        return 4;
    }
    return 1;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        MyBillIconCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyBillIconCell"];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"MyBillIconCell" owner:self options:nil] lastObject];
        }
        return cell;
    }
    if (indexPath.section == 1) {
        static NSString *cell1 = @"celll";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cell1];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cell1];
        }
        cell.textLabel.text = @"还款卡号";
        cell.detailTextLabel.text = @"建设银行 尾号(9089)";
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return cell;

    }
    if (indexPath.section == 2) {
        if (indexPath.row == 0) {
            MybillTitleCell *cell= [tableView dequeueReusableCellWithIdentifier:@"MybillTitleCell"];
            if (!cell) {
                cell = [[[NSBundle mainBundle] loadNibNamed:@"MybillTitleCell" owner:self options:nil] lastObject];
            }
            
            return cell;
        }else{
            MyBillDetailCell *cell= [tableView dequeueReusableCellWithIdentifier:@"MyBillDetailCell"];
            if (!cell) {
                cell = [[[NSBundle mainBundle] loadNibNamed:@"MyBillDetailCell" owner:self options:nil] lastObject];
            }
            
            return cell;
        }
        
        
    }
    if (indexPath.section == 3) {
        
        MyBillButtonBTnCell *cell= [tableView dequeueReusableCellWithIdentifier:@"MyBillButtonBTnCell"];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"MyBillButtonBTnCell" owner:self options:nil] lastObject];
        }
        
        return cell;
    }

    return nil;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 100.f;
    }
    if (indexPath.section == 1) {
        return 48.f;
    }
    if (indexPath.section == 2) {
        if (indexPath.row == 0) {
            return 48.f;
        }
        return 80.f;
    }
    return 176.f;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 10.f;
    }
    if (section == 1 || section == 2) {
        return 15.f;
    }
    return 0.01;
}

@end
