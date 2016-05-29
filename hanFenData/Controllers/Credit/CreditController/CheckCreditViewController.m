//
//  CheckCreditViewController.m
//  hanFenData
//
//  Created by zhangbaochuan on 16/5/13.
//  Copyright © 2016年 zbc. All rights reserved.
//

#import "CheckCreditViewController.h"
#import "NewCheckCreditViewController.h"
#import "CreditReportViewController.h"
#import "PcrEngine.h"

#define APPKEY @"65eac8f2ac964e5f81b1f741638db644"

@interface CheckCreditViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation CheckCreditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"人行信用报告查询";
    self.navigationController.navigationBarHidden = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 15.01;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 48.f;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cell1 = @"celll";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cell1];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cell1];
    }
    
    cell.textLabel.text = @"王大锤";
    cell.detailTextLabel.text = @"报告郑州生产中";
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    CreditReportViewController *creditVC = [CreditReportViewController new];
    [self.navigationController pushViewController:creditVC animated:YES];
}
- (IBAction)btnCheckCredit:(id)sender {
    
//    [PcrEngine getPersonalCreditReport:self ViewColorType:KC_COLOR_TYPE_CUSTOM AppKey:APPKEY ResponeBlock:^(KC_PCR_ERRORCODE errorCode, NSDictionary *creditReportDic) {
//        NSLog(@"引起回调 == %d== %@",errorCode,creditReportDic);
//        
//    }];
//    [PcrEngine getPersonalCreditReport:self ViewColorType:1 AppKey:APPKEY IDnumber:@"41272319890311041X" Timeliness:5 ResponeBlock:^(KC_PCR_ERRORCODE errorCode, NSDictionary *creditReportDic) {
//         NSLog(@"引起回调 == %d== %@",errorCode,creditReportDic);
//    }];
    [PcrEngine setCustomColor:[UIColor blackColor]];
    [PcrEngine getPersonalCreditReport:self ViewColorType:KC_COLOR_TYPE_CUSTOM AppKey:APPKEY ResponeBlock:^(KC_PCR_ERRORCODE errorCode, NSDictionary *creditReportDic) {
                NSLog(@"引起回调 == %d== %@",errorCode,creditReportDic);
        
            }];
//    NewCheckCreditViewController *newVC = [NewCheckCreditViewController new];
//    [self.navigationController pushViewController:newVC animated:YES];
}
@end
