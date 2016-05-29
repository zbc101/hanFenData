//
//  QuestionCheckViewController.m
//  hanFenData
//
//  Created by zhangbaochuan on 16/5/17.
//  Copyright © 2016年 zbc. All rights reserved.
//

#import "QuestionCheckViewController.h"
#import "CreditAskCell.h"
#import "CreditBtnCell.h"
#import "CreditTopTitleCell.h"
#import "CreditQuestionCell.h"
#import "CreditStatuesViewController.h"

@interface QuestionCheckViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation QuestionCheckViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.navigationItem.title = @"问题验证";
}

#pragma mark ->UITableViewDelegate,UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0 || section == 3) {
        return 1;
    }
    return 6;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        CreditTopTitleCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CreditTopTitleCell"];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"CreditTopTitleCell" owner:self options:nil] lastObject];
        }
        
        return cell;
    }else if(indexPath.section == 3){
        static NSString *cell1 = @"CreditBtnCell";
        CreditBtnCell *cell = [tableView dequeueReusableCellWithIdentifier:cell1];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"CreditBtnCell" owner:self options:nil] lastObject];
        }
        [cell.btnCreditSubmit addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        return cell;
        
    }else if(indexPath.row == 0){
        CreditQuestionCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CreditQuestionCell"];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"CreditQuestionCell" owner:self options:nil] lastObject];
        }
        
        return cell;
    }else{
        CreditAskCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CreditAskCell"];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"CreditAskCell" owner:self options:nil] lastObject];
        }
        
        return cell;
    }
    return nil;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 0.00000001;
    }
    if (section == 1) {
        return 10.f;
    }
    return 20.f;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.001;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 60.f;
    }else if (indexPath.section == 3){
        return 80.f;
    }else if (indexPath.row == 0){
        return 70.f;
    }
    return 48.f;
}

-(void)btnClick:(UIButton *)btn{
    CreditStatuesViewController *creditVC = [CreditStatuesViewController new];
    [self.navigationController pushViewController:creditVC animated:YES];
}
@end
