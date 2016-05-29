//
//  RegisterCreditViewController.m
//  hanFenData
//
//  Created by zhangbaochuan on 16/5/17.
//  Copyright © 2016年 zbc. All rights reserved.
//

#import "RegisterCreditViewController.h"
#import "RegisterNextViewController.h"

@interface RegisterCreditViewController ()
- (IBAction)btnRegister:(id)sender;

@end

@implementation RegisterCreditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"注册央行个人查询账号";
}


- (IBAction)btnRegister:(id)sender {
    RegisterNextViewController * RegisterNextVC = [RegisterNextViewController new];
    [self.navigationController pushViewController:RegisterNextVC animated:YES];
}
@end
