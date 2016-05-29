//
//  PerfectIdentityInfoViewController.m
//  hanFenData
//
//  Created by zhangbaochuan on 16/5/18.
//  Copyright © 2016年 zbc. All rights reserved.
//

#import "PerfectIdentityInfoViewController.h"

@interface PerfectIdentityInfoViewController ()

@end

@implementation PerfectIdentityInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"实名认证";
}



- (IBAction)btnperfectiden:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
