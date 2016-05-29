//
//  checkProvidentFundViewController.m
//  hanFenData
//
//  Created by zhangbaochuan on 16/5/13.
//  Copyright © 2016年 zbc. All rights reserved.
//

#import "checkProvidentFundViewController.h"
#import "DetailProvidentFundViewController.h"

@interface checkProvidentFundViewController ()

- (IBAction)btnCheckFund:(id)sender;
@end

@implementation checkProvidentFundViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"查公积金";
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
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)btnCheckFund:(id)sender {
    DetailProvidentFundViewController *detailFundVC = [DetailProvidentFundViewController new];
    [self.navigationController pushViewController:detailFundVC animated:YES];
}
@end
