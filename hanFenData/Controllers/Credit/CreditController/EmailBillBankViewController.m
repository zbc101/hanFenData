//
//  EmailBillBankViewController.m
//  hanFenData
//
//  Created by zhangbaochuan on 16/5/19.
//  Copyright © 2016年 zbc. All rights reserved.
//

#import "EmailBillBankViewController.h"
#import "BankEmailCell.h"

@interface EmailBillBankViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation EmailBillBankViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"邮箱账单";
    self.automaticallyAdjustsScrollViewInsets = NO;
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }
    return 3;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BankCardCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"BankCardCell"];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%ld月",indexPath.row];
    cell.detailTextLabel.text = @"2385元";
    if (indexPath.section == 0) {
        BankEmailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BankEmailCell"];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"BankEmailCell" owner:self options:nil] lastObject];
        }
        
        return cell;
    }
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        return 80.f;
    }
    return 48.f;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 1) {
        return 15.f;
    }
    return 0.1f;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1f;
}


@end
