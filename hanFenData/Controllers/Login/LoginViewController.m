//
//  LoginViewController.m
//  hanFenDate
//
//  Created by zhangbaochuan on 16/5/10.
//  Copyright © 2016年 zbc. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisterViewController.h"
#import "ForgetPasswordViewController.h"

@interface LoginViewController ()

- (IBAction)btn:(id)sender;
- (IBAction)btnForgetPassword:(id)sender;
- (IBAction)btnRegisiter:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *btn;

//手机号码view
@property (weak, nonatomic) IBOutlet UIView *viewTel;
@property (weak, nonatomic) IBOutlet UITextField *textFiledTel;
//登录密码
@property (weak, nonatomic) IBOutlet UIView *viewPassword;
@property (weak, nonatomic) IBOutlet UITextField *textFieldPassword;

@property (nonatomic,copy) void(^loginEnterBlock)();

@end

@implementation LoginViewController

+ (instancetype)newLoginVCWithLoginenterBlock:(void(^)())loginEnterBlock {
    LoginViewController *newLunchVC = [[LoginViewController alloc] init];
    newLunchVC.loginEnterBlock = loginEnterBlock;
    return newLunchVC;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    self.navigationItem.title = @"登录";
    self.viewTel.layer.cornerRadius = 5;
    self.viewTel.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.viewTel.layer.borderWidth = 1;
    self.viewPassword.layer.cornerRadius = 5;
    self.viewPassword.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.viewPassword.layer.borderWidth = 1;
    self.btn.layer.cornerRadius = 5;

}


- (IBAction)btn:(id)sender {
    if ([self.flagStirng isEqualToString:@"注册"]) {
        [self.navigationController popToRootViewControllerAnimated:YES];
    }else{
        [self dismissViewControllerAnimated:YES completion:^{
            
        }];
        
        if (self.loginEnterBlock != nil) {
            _loginEnterBlock();
        }

    }
    
    
}

- (IBAction)btnForgetPassword:(id)sender {
    ForgetPasswordViewController *forgetVC = [ForgetPasswordViewController new];
    [self.navigationController pushViewController:forgetVC animated:YES];
}

- (IBAction)btnRegisiter:(id)sender {
    RegisterViewController *RegiVC = [RegisterViewController new];

    [self.navigationController pushViewController:RegiVC animated:YES];
}

//#pragma mark -> RegisterViewControllerDelegate
//
//-(void)RegisterViewControllerDelegateNUll{
//    if (self.loginEnterBlock != nil) {
//        _loginEnterBlock();
//    }
//}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear: animated];
}

@end
