//
//  RegisterViewController.m
//  hanFenDate
//
//  Created by zhangbaochuan on 16/5/10.
//  Copyright © 2016年 zbc. All rights reserved.
//

#import "RegisterViewController.h"
#import "LoginViewController.h"
#import "NewUserRegisterViewController.h"
#import "SMSAlertView.h"

@interface RegisterViewController ()

- (IBAction)RegisterBtn:(id)sender;
- (IBAction)btnLogin:(id)sender;

@property (weak, nonatomic) IBOutlet UIView *viewTel;
@property (weak, nonatomic) IBOutlet UITextField *textFieldTel;
@property (weak, nonatomic) IBOutlet UIButton *btn;

@property (nonatomic, strong) SMSAlertView *alertView;

@property (nonatomic,copy) void(^registerEnterBlock)();
@property (nonatomic,strong) NSString *flagSting;
@end

@implementation RegisterViewController

+ (instancetype)newRegisiterVCWithRegistring:(NSString *)RegisterString LoginenterBlock:(void(^)())registerEnterBlock {
    RegisterViewController *newLunchVC = [[RegisterViewController alloc] init];
    newLunchVC.flagSting = RegisterString;
    newLunchVC.registerEnterBlock = registerEnterBlock;
    return newLunchVC;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"新用户注册";
    self.viewTel.layer.cornerRadius = 5;
    self.viewTel.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.viewTel.layer.borderWidth = 1;
    self.btn.layer.cornerRadius = 5;
    [self addBackItem];
}

- (IBAction)RegisterBtn:(id)sender {
    
    _alertView = [[[NSBundle mainBundle] loadNibNamed:@"SMSAlertView" owner:self options:nil] lastObject];
    _alertView.frame = CGRectMake(0, 0, _k_w, _k_h);
    _alertView.btncountDown.tag = 100;
    [_alertView.btncountDown addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    _alertView.btnSure.tag = 101;
    [_alertView.btnSure addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [_alertView show];
//    [self startTime];
    

    
}
-(void)btnClick:(UIButton *)btn{
    switch (btn.tag) {
            case 100:
                [self startTime];
            break;
            case 101:{
                [_alertView hide];
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    NewUserRegisterViewController *newUserRegisterVC = [NewUserRegisterViewController new];
                    newUserRegisterVC.flagSting = _flagSting;
                    [self.navigationController pushViewController:newUserRegisterVC animated:YES];
                });
               
            }
            break;
        default:
            break;
    }
    
}

- (IBAction)btnLogin:(id)sender {
    
    if ([self.flagSting isEqualToString:@"注册"]) {
        LoginViewController *loginVC = [LoginViewController new];
        loginVC.flagStirng = _flagSting;
        [self.navigationController pushViewController:loginVC animated:YES];
    }else{
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
    
    //Block 回调
//    LoginViewController *loginVC = [LoginViewController newLoginVCWithLoginenterBlock:^{
//        if (self.registerEnterBlock != nil) {
//            _registerEnterBlock();
//        }
//    }];
//    [self.navigationController pushViewController:loginVC animated:YES];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

#pragma mark 倒计时
-(void)startTime{
    __block int timeout= 60; //倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(timeout<=0){ //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                [_alertView.btncountDown setTitle:@"重新" forState:UIControlStateNormal];
                _alertView.btncountDown.userInteractionEnabled = YES;
            });
        }else{
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [UIView beginAnimations:nil context:nil];
                [UIView setAnimationDuration:1];
                [_alertView.btncountDown setTitle:[NSString stringWithFormat:@"%zd",timeout] forState:UIControlStateNormal];
                [UIView commitAnimations];
                _alertView.btncountDown.userInteractionEnabled = NO;
            });
            timeout--;
        }
    });
    dispatch_resume(_timer);
    
}


@end
