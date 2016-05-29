//
//  FixInfoPerfectIdentityViewController.m
//  hanFenData
//
//  Created by zhangbaochuan on 16/5/18.
//  Copyright © 2016年 zbc. All rights reserved.
//

#import "FixInfoPerfectIdentityViewController.h"
#import "PerfectIdentityInfoCell.h"
#import "CreditBtnCell.h"

@interface FixInfoPerfectIdentityViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSArray *placeArr;
@end

@implementation FixInfoPerfectIdentityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"资料修改";
    self.automaticallyAdjustsScrollViewInsets = NO;
    _placeArr = @[@"姓名/身份证号",@"手机号",@"学历",@"现居住地",
                  @"居住地详址",@"单位名称",@"单位所在地",@"单位地址"];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 1) {
        return 1;
    }
    return _placeArr.count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cell1 = @"cell1";
    PerfectIdentityInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:cell1];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"PerfectIdentityInfoCell" owner:self options:nil] lastObject];
    }
    cell.textfiledTitile.placeholder = _placeArr[indexPath.row];
    if (indexPath.row == 0) {
        cell.labelDetail.text = @"不可修改";
    }
    if (indexPath.row == 1 || indexPath.row == 4 ||
        indexPath.row == 5 || indexPath.row == 6 ) {
        cell.imageIndexDetail.hidden = YES;
    }
    
    if (indexPath.section == 1) {
        static NSString *cell1 = @"CreditBtnCell";
        CreditBtnCell *cell = [tableView dequeueReusableCellWithIdentifier:cell1];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"CreditBtnCell" owner:self options:nil] lastObject];
        }
        [cell.btnCreditSubmit setTitle:@"保存" forState:UIControlStateNormal];
        [cell.btnCreditSubmit addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        return cell;

    }
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 1) {
        return 80.f;
    }
    return 56.f;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 1) {
        return 100.f;
    }
    return 8.f;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}

-(void)btnClick:(UIButton *)btn{
    [self.navigationController popViewControllerAnimated:YES];
}
@end
