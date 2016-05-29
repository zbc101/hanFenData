//
//  PapidApplayViewController.m
//  hanFenData
//
//  Created by zhangbaochuan on 16/5/16.
//  Copyright © 2016年 zbc. All rights reserved.
//

#import "PapidApplayViewController.h"
#import "loanApplyViewController.h"

@interface PapidApplayViewController ()

@end

@implementation PapidApplayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"急速借款";
}


- (IBAction)btnMoreInfo:(id)sender {
    self.tabBarController.selectedIndex = 1;
    [self.navigationController popToRootViewControllerAnimated:NO];
    
}

- (IBAction)btnCheckProgress:(id)sender {
    loanApplyViewController *loanVC = [loanApplyViewController new];
    [self.navigationController pushViewController:loanVC animated:YES];
}
@end
