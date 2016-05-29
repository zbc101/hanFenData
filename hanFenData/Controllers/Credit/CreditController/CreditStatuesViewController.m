//
//  CreditStatuesViewController.m
//  hanFenData
//
//  Created by zhangbaochuan on 16/5/17.
//  Copyright © 2016年 zbc. All rights reserved.
//

#import "CreditStatuesViewController.h"



@interface CreditStatuesViewController ()
- (IBAction)btnCreditSattues:(id)sender;

@end

@implementation CreditStatuesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"人行信用报告查询";
}



- (IBAction)btnCreditSattues:(id)sender {

    [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:1] animated:YES];

    
}
@end
