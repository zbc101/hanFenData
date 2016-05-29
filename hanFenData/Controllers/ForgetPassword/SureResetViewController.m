//
//  SureResetViewController.m
//  hanFenData
//
//  Created by zhangbaochuan on 16/5/12.
//  Copyright © 2016年 zbc. All rights reserved.
//

#import "SureResetViewController.h"

@interface SureResetViewController ()
- (IBAction)btnNextSure:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *viewTel;
@property (weak, nonatomic) IBOutlet UITextField *textFieldTel;
@property (weak, nonatomic) IBOutlet UIButton *btn;

@end

@implementation SureResetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.viewTel.layer.cornerRadius = 5;
    self.viewTel.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.viewTel.layer.borderWidth = 1;
    self.btn.layer.cornerRadius = 5;
    [self addBackItem];
    self.navigationItem.title = @"忘记密码";
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

- (IBAction)btnNextSure:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}
@end
