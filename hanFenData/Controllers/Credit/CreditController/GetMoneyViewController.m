//
//  GetMoneyViewController.m
//  hanFenData
//
//  Created by zhangbaochuan on 16/5/20.
//  Copyright © 2016年 zbc. All rights reserved.
//

#import "GetMoneyViewController.h"
#import "MyLoanMoneyViewController.h"

@interface GetMoneyViewController ()

@property (nonatomic, strong) UILabel *bigCircleLabel;//外大圆
@property (nonatomic, strong) UILabel *cirleLabel;//内灰圆
@property (nonatomic, strong) UILabel *textLabel;//内容二、三
@property (nonatomic, strong) CAShapeLayer *loadingLayer;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, assign) NSInteger itime;
@property (nonatomic, strong) UIView *homeBgView;

@end

@implementation GetMoneyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"提款";
    self.homeBgView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, _k_w, (15 + _k_h/4 +20+15))];
    self.homeBgView.backgroundColor =[UIColor blackColor];
    self.bigCircleLabel = [[UILabel alloc] initWithFrame:CGRectMake((_k_w - _k_h/4 - 20)/2.f, 15, _k_h/4 + 20, _k_h/4 +20)];
    self.cirleLabel = [[UILabel alloc] initWithFrame:CGRectMake((_k_w -  _k_h/4)/2.f, 25,  _k_h/4,  _k_h/4)];
    self.textLabel = [[UILabel alloc] initWithFrame:CGRectMake((_k_w -  _k_h/4 + 20)/2.f, 35, _k_h/4-20, _k_h/4-20)];
//    self.view.backgroundColor = [UIColor blackColor];
    
    [self.view addSubview:_homeBgView];
    _viewWeek.layer.cornerRadius = 5;
    _viewWeek.layer.borderWidth = 1;
    _viewWeek.layer.borderColor = RGBColor(216, 158, 66).CGColor;
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    //    self.navigationController.navigationBarHidden = YES;
    [self drawHalfCircle];
    self.itime = 0;
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    _itime = 0;
    [self.timer invalidate];
    self.timer = nil;
}

-(CAShapeLayer *)drawCircle {
    
    self.bigCircleLabel.backgroundColor = [UIColor blackColor];
    self.bigCircleLabel.layer.cornerRadius = (_k_h/4 +20)/2.f;
    self.bigCircleLabel.layer.borderWidth = 1.5f;
    self.bigCircleLabel.layer.borderColor = RGBColor(198, 140, 64).CGColor;
    self.bigCircleLabel.clipsToBounds = YES;
    [self.homeBgView addSubview:self.bigCircleLabel];
    
    self.cirleLabel.backgroundColor = [UIColor blackColor];
    self.cirleLabel.layer.cornerRadius = _k_h/4/2;
    self.cirleLabel.textAlignment = NSTextAlignmentCenter;
    self.cirleLabel.numberOfLines = 0;
    self.cirleLabel.text = @"借款金额\n\n";
    self.cirleLabel.textColor = RGBColor(232, 178, 84);
    self.cirleLabel.layer.borderColor = RGBColor(68, 68, 68).CGColor;
    self.cirleLabel.layer.borderWidth = 5.f;
    if (_k_w < 375) {
        self.cirleLabel.font = [UIFont boldSystemFontOfSize:15];
    }else{
        self.cirleLabel.font = [UIFont boldSystemFontOfSize:17];
    }
    
    self.cirleLabel.clipsToBounds = YES;
    [self.homeBgView addSubview:self.cirleLabel];
    
    self.textLabel.backgroundColor = [UIColor clearColor];
    self.textLabel.textAlignment = NSTextAlignmentCenter;
    self.textLabel.numberOfLines = 0;
    self.textLabel.text = @"\n¥1000元";
    if (_k_w < 375) {
        self.textLabel.font = [UIFont systemFontOfSize:30];
    }else{
        self.textLabel.font = [UIFont systemFontOfSize:35];
    }
    
    self.textLabel.textColor = RGBColor(216, 158, 66);
    [self.homeBgView addSubview:self.textLabel];
    
    
    NSMutableAttributedString *att = [[NSMutableAttributedString alloc] initWithString:self.textLabel.text];
    [att addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:20] range:NSMakeRange(1, 1)];
    
    [att addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:17] range:NSMakeRange([self.textLabel.text length]-1, 1)];
    
    
//    [att addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithCGColor:RGBColor(232, 178, 84).CGColor] range:NSMakeRange(8, 4)];
    self.textLabel.attributedText = att;
    
    CAShapeLayer *circleLayer = [CAShapeLayer layer];
    //指定frame，只是为了设置宽度和高度
    circleLayer.frame = CGRectMake(0, 0,  _k_h/4 -5,  _k_h/4 -5);
    circleLayer.position = CGPointMake(_k_w / 2.0, _k_h/8 + 25);
    circleLayer.fillColor = [UIColor clearColor].CGColor;
    circleLayer.lineWidth = 5.0;
    circleLayer.strokeColor = RGBColor(232, 178, 84).CGColor;
    circleLayer.lineJoin = kCALineJoinBevel;
    circleLayer.lineCap = kCALineCapRound;
    //使用UIBezierPaht创建路径
    CGRect frame = CGRectMake(0, 0,  _k_h/4 - 5,  _k_h/4 - 5);
    UIBezierPath *circlePath = [UIBezierPath bezierPathWithOvalInRect:frame];
    circlePath.lineCapStyle = kCGLineCapRound;
    circlePath.lineJoinStyle = kCGLineJoinBevel;
    //设置cashapleay 与uibezierPath 关联
    circleLayer.path = circlePath.CGPath;
    
    //将cashaperlayer放到某个层上显示
    [self.homeBgView.layer addSublayer:circleLayer];
    
    
    
    return circleLayer;
}

#pragma mark ->画半圆
//画半圆
- (void)drawHalfCircle {
    self.loadingLayer = [self drawCircle];
    //    当strokeStart的值为0慢慢变成1时，我们看到路径是慢慢消失的
    //
    // 这个是用于指定画笔的开始与结束点
    self.loadingLayer.strokeStart = 0.375;
    self.loadingLayer.strokeEnd = 0.375;
    //    self.loadingLayer.lineJoin = kCALineJoinRound;
    self.loadingLayer.lineCap = kCALineCapRound;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.05
                                                  target:self
                                                selector:@selector(updateCircle)
                                                userInfo:nil
                                                 repeats:YES];
}


- (void)updateCircle {
    DLog(@"%f---%f",self.loadingLayer.strokeStart,self.loadingLayer.strokeEnd);
    
    self.loadingLayer.strokeEnd += 0.008;
    
    CGFloat tq = (0.85 - 0.375)/0.008;
//    CGFloat tt = 500/tq;
    //    DLog(@"itime = %ld ==%.0f==%.0f",(long)_itime,tt,tq);
//    self.cirleLabel.text = [NSString stringWithFormat:@"%.0f\n",tt * (_itime ++)];
    
    if ( self.loadingLayer.strokeEnd >= 0.85 || _itime >= (NSInteger)tq) {
        //            DLog(@"ajglg=%.0f",_timer);
//        self.cirleLabel.text = [NSString stringWithFormat:@"500\n"];
        self.loadingLayer.strokeStart = 0.375;
        self.loadingLayer.strokeEnd = 0.85;
        _itime = 0;
        [self.timer invalidate];
        self.timer = nil;
    }
    
}


- (IBAction)btnGetmoney:(id)sender {
    MyLoanMoneyViewController *MyLoanMoneyVC = [MyLoanMoneyViewController new];
    [self.navigationController pushViewController:MyLoanMoneyVC animated:YES];
    
}
@end
