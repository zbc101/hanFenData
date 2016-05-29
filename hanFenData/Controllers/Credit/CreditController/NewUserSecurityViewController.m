//
//  NewUserSecurityViewController.m
//  hanFenData
//
//  Created by zhangbaochuan on 16/5/17.
//  Copyright © 2016年 zbc. All rights reserved.
//

#import "NewUserSecurityViewController.h"

@interface NewUserSecurityViewController ()
- (IBAction)btnCheckSecurity:(id)sender;

@end

@implementation NewUserSecurityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"社保查询";
    self.navigationController.navigationBarHidden = NO;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
}



- (IBAction)btnCheckSecurity:(id)sender {
}
@end
