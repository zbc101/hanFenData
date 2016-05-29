//
//  SMSAlertView.m
//  hanFenData
//
//  Created by zhangbaochuan on 16/5/24.
//  Copyright © 2016年 zbc. All rights reserved.
//

#import "SMSAlertView.h"

@implementation SMSAlertView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)awakeFromNib{
    [self setupUI];
}

-(void)setupUI{
    self.backgroundColor = [UIColor colorWithWhite:0 alpha:0];
    self.bgview.backgroundColor = [UIColor colorWithWhite:0 alpha:0.6];
    self.alertView.backgroundColor = [UIColor whiteColor];
    self.alertView.alpha = 1.f;
    self.btncountDown.layer.cornerRadius = 3.f;
    self.btncountDown.layer.borderWidth = 1.f;
    self.btncountDown.layer.borderColor = [UIColor lightGrayColor].CGColor;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hide)];
    [self addGestureRecognizer:tap];
}

- (void)hide {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
       [UIView animateWithDuration:0.4 animations:^{
          self.alertView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.2, 1.2);
       } completion:^(BOOL finished) {
           [UIView animateWithDuration:0.3 animations:^{
               self.alertView.alpha = 0;
               self.alertView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.0, 0.0);
           } completion:^(BOOL finished) {
               [self removeFromSuperview];
           }];
       }];
    });
    
//    [UIView animateWithDuration:0.05 animations:^{
//        self.alertView.alpha = 0;
//    } completion:^(BOOL finished) {
//        [self removeFromSuperview];
//    }];
}

-(void)show
{
    //显示
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:self];
    
    [self donghua];
}

-(void)donghua
{
    self.alertView.alpha = 0;
    self.alertView.hidden = YES;
    self.alertView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.0, 0.0);
    [UIView animateWithDuration:0.3 animations:^{
        self.alertView.alpha = 1;
        self.alertView.hidden = NO;
        self.alertView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.2, 1.2);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.2 animations:^{
            self.alertView.alpha = 1;
            self.alertView.hidden = NO;
            self.alertView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.8, 0.8);
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.4 animations:^{
                self.alertView.alpha = 1;
                self.alertView.hidden = NO;
                self.alertView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.0, 1.0);
            } completion:^(BOOL finished) {
                
            }];
        }];
    }];
   
//    [self.btnSure addTarget:self action:@selector(surebtnClick) forControlEvents:UIControlEventTouchUpInside];
//    [self.btncountDown addTarget:self action:@selector(dissurebtnClick) forControlEvents:UIControlEventTouchUpInside];
//    [self.textfiledCodes addTarget:self action:@selector(textFieldcode:) forControlEvents:UIControlEventValueChanged];
}

-(void)surebtnClick{
    DLog(@"确定");
}

-(void)dissurebtnClick
{
    DLog(@"倒计时");
}

-(void)textFieldcode:(UITextField *)textfiled
{
    DLog(@"%@",textfiled.text);
}

@end
