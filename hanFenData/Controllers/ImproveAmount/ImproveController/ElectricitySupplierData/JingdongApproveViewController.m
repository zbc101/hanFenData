//
//  JingdongApproveViewController.m
//  hanFenData
//
//  Created by zhangbaochuan on 16/5/19.
//  Copyright © 2016年 zbc. All rights reserved.
//

#import "JingdongApproveViewController.h"

@interface JingdongApproveViewController ()

@end

@implementation JingdongApproveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"京东认证";
}


- (IBAction)btnJingdong:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
