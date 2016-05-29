//
//  CreditReportViewController.m
//  hanFenData
//
//  Created by zhangbaochuan on 16/5/20.
//  Copyright © 2016年 zbc. All rights reserved.
//

#import "CreditReportViewController.h"
#import "CreditListCell.h"
#import "CreditListWhichCell.h"

@interface CreditReportViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) NSArray *titleArr;

@end

@implementation CreditReportViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"人行个人信用信息报告";
    self.automaticallyAdjustsScrollViewInsets = NO;
    _titleArr = @[@"5",@"5",@"0",@"0",@"0",
                  @"装好是",@"三个",@"三个",@"山沟沟",@"山沟沟"];
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 10.f;
    }
    return 45.01;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 214.f;
    }
    return 60.f;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        CreditListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CreditListCell"];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"CreditListCell" owner:self options:nil] lastObject];
        }
        
        return cell;
    }else {
        CreditListWhichCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CreditListWhichCell"];
        if (!cell) {
            cell = [[CreditListWhichCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"CreditListWhichCell"];
            
        }
        [cell SetviewWithHang:2 List:5 TitleArray:_titleArr];
        return cell;
    }
    
    
    return nil;
    
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (section == 1) {
        return @"信用卡记录";
    }
    if (section == 2) {
        return @"信用卡记录";
    }
    if (section == 3) {
        return @"信用卡记录";
    }
    return nil;
}

@end
