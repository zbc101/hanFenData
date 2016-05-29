//
//  NewCheckCreditViewController.m
//  hanFenData
//
//  Created by zhangbaochuan on 16/5/17.
//  Copyright © 2016年 zbc. All rights reserved.
//

#import "NewCheckCreditViewController.h"
#import "LoginCreditViewController.h"
#import "RegisterCreditViewController.h"

@interface NewCheckCreditViewController ()
- (IBAction)btnNewCheckCrditLogin:(id)sender;
- (IBAction)btnNewCheckCrditRegister:(id)sender;

@end

@implementation NewCheckCreditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"人行个人信用报告服务平台";
    self.navigationController.navigationBarHidden = NO;
}



- (IBAction)btnNewCheckCrditLogin:(id)sender {
    LoginCreditViewController *LoginVC = [LoginCreditViewController new];
    [self.navigationController pushViewController:LoginVC animated:YES];
}

- (IBAction)btnNewCheckCrditRegister:(id)sender {
    RegisterCreditViewController *RegisterCreditVC = [RegisterCreditViewController new];
    [self.navigationController pushViewController:RegisterCreditVC animated:YES];
}
@end
