//
//  GetEmailBankViewController.m
//  hanFenData
//
//  Created by zhangbaochuan on 16/5/19.
//  Copyright © 2016年 zbc. All rights reserved.
//

#import "GetEmailBankViewController.h"
#import "EmailBillBankViewController.h"

@interface GetEmailBankViewController ()

@end

@implementation GetEmailBankViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"获取邮箱账单";
}



- (IBAction)btnGetEmail:(id)sender {
    EmailBillBankViewController *EmailVC = [EmailBillBankViewController new];
    [self.navigationController pushViewController:EmailVC animated:YES];
}
@end
