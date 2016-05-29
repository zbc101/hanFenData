//
//  ShowProvidentFundViewController.m
//  hanFenData
//
//  Created by zhangbaochuan on 16/5/16.
//  Copyright © 2016年 zbc. All rights reserved.
//

#import "ShowProvidentFundViewController.h"
#import "checkProvidentFundViewController.h"
#import "DetailProvidentFundViewController.h"


@interface ShowProvidentFundViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation ShowProvidentFundViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.navigationController.navigationBarHidden = NO;
    self.navigationItem.title = @"公积金查询";
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 15.01;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cell1 = @"celll";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cell1];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cell1];
    }
    
    cell.textLabel.text = @"王大锤         上海市";
    cell.detailTextLabel.text = @"2016-03-25";
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

    return cell;

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    DetailProvidentFundViewController *detailFundVC = [DetailProvidentFundViewController new];
    [self.navigationController pushViewController:detailFundVC animated:YES];
}

- (IBAction)btnNewUser:(id)sender {
    checkProvidentFundViewController *checkVC = [checkProvidentFundViewController new];
    [self.navigationController pushViewController:checkVC animated:YES];
//    self.hidesBottomBarWhenPushed = NO;cihg
}
@end
