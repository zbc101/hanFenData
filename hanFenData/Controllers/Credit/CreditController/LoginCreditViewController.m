//
//  LoginCreditViewController.m
//  hanFenData
//
//  Created by zhangbaochuan on 16/5/17.
//  Copyright © 2016年 zbc. All rights reserved.
//

#import "LoginCreditViewController.h"
#import "QuestionCheckViewController.h"

@interface LoginCreditViewController ()

@end

@implementation LoginCreditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"人行信用报告查询";
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

- (IBAction)btnLoginCredit:(id)sender {
    QuestionCheckViewController *quesVC = [QuestionCheckViewController new];
    [self.navigationController pushViewController:quesVC animated:YES];
}
@end
