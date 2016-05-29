//
//  MineIcontitleViewController.m
//  hanFenData
//
//  Created by zhangbaochuan on 16/5/19.
//  Copyright © 2016年 zbc. All rights reserved.
//

#import "MineIcontitleViewController.h"
#import "AccountIconCell.h"
#import "AccountInfoCell.h"
#import "AccountSwiftCell.h"
#import "AccountReturnBackCell.h"
#import "PerfectIdentityInfoViewController.h"
#import "LoginViewController.h"
#import "ChangePasswordViewController.h"

@interface MineIcontitleViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) NSArray *titleArr;

@end

@implementation MineIcontitleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
     self.navigationItem.title = @"账户信息";
    self.automaticallyAdjustsScrollViewInsets = NO;
    _titleArr = @[@"实名认证",@"登录手机号",@"昵称",@"修改登录密码",
                  @"好友可查看信用报告",@"好友可查看公积金",@"好友可查看社保记录"];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 1) {
        return 4;
    }
    if (section == 2) {
        return 3;
    }
    return 1;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        static NSString *cell1 = @"AccountIconCell";
        AccountIconCell *cell = [tableView dequeueReusableCellWithIdentifier:cell1];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"AccountIconCell" owner:self options:nil] lastObject];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else if (indexPath.section == 1){
        static NSString *cell1 = @"AccountInfoCell";
        AccountInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:cell1];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"AccountInfoCell" owner:self options:nil] lastObject];
        }
        cell.labelText.text = _titleArr[indexPath.row];
        if (indexPath.row == 1) {
            cell.imgeIndex.hidden = YES;
            cell.labelDetail.text = @"13489098777";
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else if (indexPath.section == 2){
        static NSString *cell1 = @"AccountSwiftCell";
        AccountSwiftCell *cell = [tableView dequeueReusableCellWithIdentifier:cell1];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"AccountSwiftCell" owner:self options:nil] lastObject];
        }
        cell.labelText.text = _titleArr[indexPath.row + 4];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;

    }else if (indexPath.section == 3){
        static NSString *cell1 = @"AccountReturnBackCell";
        AccountReturnBackCell *cell = [tableView dequeueReusableCellWithIdentifier:cell1];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"AccountReturnBackCell" owner:self options:nil] lastObject];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    
    
    return nil;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 100.f;
    }
    return 48.f;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 10.f;
    }
    return 15.1f;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            PerfectIdentityInfoViewController *perFectVC = [PerfectIdentityInfoViewController new];
            self.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:perFectVC animated:YES];
        }
        if (indexPath.row == 3) {
            ChangePasswordViewController *changePaswordVC = [ChangePasswordViewController new];
            self.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:changePaswordVC animated:YES];
        }
    }
    if (indexPath.section == 2) {
        
    }
    if (indexPath.section == 3) {
        LoginViewController *loginVC = [LoginViewController new];
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:loginVC];
        [self presentViewController:nav animated:YES completion:nil];
    }
    
    
}

@end
