//
//  RegisterSuccessViewController.m
//  hanFenData
//
//  Created by zhangbaochuan on 16/5/17.
//  Copyright © 2016年 zbc. All rights reserved.
//

#import "RegisterSuccessViewController.h"
#import "LoginCreditViewController.h"

@interface RegisterSuccessViewController ()
- (IBAction)btnRegistercheck:(id)sender;

@end

@implementation RegisterSuccessViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"注册央行个人查询账号";
}



- (IBAction)btnRegistercheck:(id)sender {
    LoginCreditViewController *LoginVC = [LoginCreditViewController new];
    [self.navigationController pushViewController:LoginVC animated:YES];
}
@end
