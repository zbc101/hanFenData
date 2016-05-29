//
//  AddCardCreditViewController.m
//  hanFenData
//
//  Created by zhangbaochuan on 16/5/17.
//  Copyright © 2016年 zbc. All rights reserved.
//

#import "AddCardCreditViewController.h"
#import "BankCardViewController.h"

@interface AddCardCreditViewController ()

@end

@implementation AddCardCreditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"添加信用卡";
    self.navigationController.navigationBarHidden = NO;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
}


- (IBAction)btnAddSure:(id)sender {

    BankCardViewController *bankVC = [BankCardViewController new];
    [self.navigationController pushViewController:bankVC animated:YES];
}
@end
