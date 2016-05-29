//
//  CtripApproveViewController.m
//  hanFenData
//
//  Created by zhangbaochuan on 16/5/19.
//  Copyright © 2016年 zbc. All rights reserved.
//

#import "CtripApproveViewController.h"

@interface CtripApproveViewController ()

@end

@implementation CtripApproveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"携程认证";
}



- (IBAction)btnCrtip:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
