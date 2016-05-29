//
//  WithdrawalViewController.m
//  hanFenData
//
//  Created by zhangbaochuan on 16/5/16.
//  Copyright © 2016年 zbc. All rights reserved.
//

#import "WithdrawalViewController.h"
#import "MyLoanMoneyViewController.h"

@interface WithdrawalViewController ()

@end

@implementation WithdrawalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"提款";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)btnWithDrawl:(id)sender {
    MyLoanMoneyViewController *MyLoanMoneyVC = [MyLoanMoneyViewController new];
    [self.navigationController pushViewController:MyLoanMoneyVC animated:YES];
}
@end
