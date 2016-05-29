//
//  FaxinDaiViewController.m
//  hanFenData
//
//  Created by zhangbaochuan on 16/5/19.
//  Copyright © 2016年 zbc. All rights reserved.
//

#import "FaxinDaiViewController.h"
#import "PapidApplayViewController.h"
#import "PerfectIdentityViewController.h"

@interface FaxinDaiViewController ()

@end

@implementation FaxinDaiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"发薪贷";
    self.view.backgroundColor = [UIColor blackColor];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick:)];
    [_viewBottom addGestureRecognizer:tap];
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick:)];
    [_viewBottom2 addGestureRecognizer:tap1];
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
-(void)tapClick:(UITapGestureRecognizer *)tag{
    PapidApplayViewController *ApplayVC = [PapidApplayViewController new];
    [self.navigationController pushViewController:ApplayVC animated:YES];
}
- (IBAction)btnSure:(id)sender {
        PerfectIdentityViewController *PerfectIdentityVC = [PerfectIdentityViewController new];
        [self.navigationController pushViewController:PerfectIdentityVC animated:YES];
}
@end
