//
//  RegisterNextViewController.m
//  hanFenData
//
//  Created by zhangbaochuan on 16/5/17.
//  Copyright © 2016年 zbc. All rights reserved.
//

#import "RegisterNextViewController.h"
#import "RegisterSuccessViewController.h"

@interface RegisterNextViewController ()
- (IBAction)btnNextRegistrer:(id)sender;

@end

@implementation RegisterNextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"注册央行个人查询账号";
}



- (IBAction)btnNextRegistrer:(id)sender {
    RegisterSuccessViewController *RegisterSuccessVC = [RegisterSuccessViewController new];
    [self.navigationController pushViewController:RegisterSuccessVC animated:YES];
}
@end
