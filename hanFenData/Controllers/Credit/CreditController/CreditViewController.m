//
//  CreditViewController.m
//  hanFenDate
//
//  Created by zhangbaochuan on 16/5/10.
//  Copyright © 2016年 zbc. All rights reserved.
//

#import "CreditViewController.h"

@interface CreditViewController ()

@property (nonatomic, strong) UILabel *bigCircleLabel;//外大圆
@property (nonatomic, strong) UILabel *cirleLabel;//内灰圆
@property (nonatomic, strong) UILabel *textLabel;//内容二、三

@property (nonatomic, strong) CAShapeLayer *loadingLayer;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, assign) NSInteger itime;
@property (nonatomic, strong) UIView *homeBgView;

@end

@implementation CreditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    self.fd_prefersNavigationBarHidden = YES;
    
    self.homeBgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, _k_w, (35 + _k_h/3 +20 + 19 + 60))];
    self.homeBgView.backgroundColor =[UIColor colorWithPatternImage:[UIImage imageNamed:@"02_home_bj"]];
    self.bigCircleLabel = [[UILabel alloc] initWithFrame:CGRectMake((_k_w - _k_h/3 - 20)/2.f, 35, _k_h/3 + 20, _k_h/3 +20)];
    self.cirleLabel = [[UILabel alloc] initWithFrame:CGRectMake((_k_w -  _k_h/3)/2.f, 45,  _k_h/3,  _k_h/3)];
    self.textLabel = [[UILabel alloc] initWithFrame:CGRectMake((_k_w -  _k_h/3 + 20)/2.f, 55, _k_h/3-20, _k_h/3-20)];
    
    self.view.backgroundColor = [UIColor blackColor];
    
    [self.view addSubview:_homeBgView];
    
    [self setModdleUI];
    [self setbuttomUI];
}


-(void) setbuttomUI{
    CGFloat heithtop = (35 + _k_h/3 +20 + 19 + 60);
    CGFloat heith = (_k_h - 49 - (35 + _k_h/3 +20 + 19 + 60))/2;
    NSArray *imageArr = @[@"02_home_icon01",@"02_home_icon03",@"02_home_icon06",
                          @"02_home_icon04",@"02_home_icon02",@"02_home_icon05"];
    NSArray *titleArr = @[@"急速借款",@"查征信",@"信用卡还款",
                          @"查社保",@"额度大比拼",@"查公积金"];
    int ztag = 200;
    for (int i = 0; i< 3; i++) {
        for (int j = 0; j < 2; j++) {
            UIView * view = [[UIView alloc] initWithFrame:CGRectMake(i * _k_w/3, heithtop + j * heith, _k_w/3, heith)];
            view.backgroundColor = [UIColor whiteColor];
            view.layer.borderWidth = .5f;
            view.tag = ztag ++;
            view.layer.borderColor = RGBColor(239, 239, 239).CGColor;
            view.userInteractionEnabled = YES;
            [self.view addSubview:view];
            
//            DLog(@"%d ====%d ==%d==%d",i ,j ,i+ 2*j,ztag);
            
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClik:)];
            [view addGestureRecognizer:tap];
            
            UIImageView *imageview =[[UIImageView alloc] initWithFrame:CGRectMake((_k_w/3-heith/4)/2, heith/4,  heith/4, heith/4)];
            imageview.image = [UIImage imageNamed:imageArr[ztag-201]];
            
            [view addSubview:imageview];
            
            UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, heith/4 + heith/4, _k_w/3, heith/5)];
            titleLabel.text = titleArr[ztag - 201];
            titleLabel.backgroundColor = [UIColor clearColor];
            titleLabel.textAlignment = NSTextAlignmentCenter;
            if (_k_w < 375) {
                titleLabel.font = [UIFont systemFontOfSize:12];
            }else{
                titleLabel.font = [UIFont systemFontOfSize:15];
            }
            
            titleLabel.textColor = [UIColor grayColor];
            [view addSubview:titleLabel];
            
        }
    }
}

#pragma mark ->中间层 @"基础憨分",@"憨分生活",@"社交憨分"
//设置
-(void)setModdleUI{
    CGFloat width = (_k_w)/3;
    NSArray *titleArr = @[@"基础憨分",@"憨分生活",@"社交憨分"];
    NSArray *raioArr = @[@"%80",@"%60",@"%50"];
    for (int i = 0; i<3; i++) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(i * width, 35 + _k_h/3 +20 + 19, width, 52)];
        view.backgroundColor = [UIColor clearColor];
        view.userInteractionEnabled = YES;
        view.tag = i + 100;
        [self.view addSubview:view];
        if (i < 2) {
            UIView *viewbordth = [[UIView alloc] initWithFrame:CGRectMake(i * width + width, 35 + _k_h/3 +20 + 19+ 2, 1.5, 50)];
            viewbordth.backgroundColor = [UIColor grayColor];
            [self.view addSubview:viewbordth];
        }
        UILabel *lableTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, 20)];
        lableTitle.text = titleArr[i];
        lableTitle.textColor = [UIColor whiteColor];
        lableTitle.backgroundColor = [UIColor clearColor];
        lableTitle.textAlignment = NSTextAlignmentCenter;
//        [lableTitle setAdjustsFontSizeToFitWidth:YES];
        lableTitle.font = [UIFont systemFontOfSize:15];
        [view addSubview:lableTitle];
    
        UILabel *lableTitletext = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, width, 64 -20)];
        lableTitletext.text = raioArr[i];
        lableTitletext.textColor = [UIColor whiteColor];
        lableTitletext.backgroundColor = [UIColor clearColor];
//        [lableTitletext setAdjustsFontSizeToFitWidth:YES];
        lableTitletext.font = [UIFont systemFontOfSize:20];
        lableTitletext.textAlignment = NSTextAlignmentCenter;
        [view addSubview:lableTitletext];
        
    }
    
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
//    self.navigationController.navigationBarHidden = YES;
    self.fd_prefersNavigationBarHidden = YES;
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
    self.bigCircleLabel.layer.cornerRadius = (_k_h/3 +20)/2.f;
    self.bigCircleLabel.layer.borderWidth = 1.5f;
    self.bigCircleLabel.layer.borderColor = RGBColor(198, 140, 64).CGColor;
    self.bigCircleLabel.clipsToBounds = YES;
    [self.homeBgView addSubview:self.bigCircleLabel];
    
    self.cirleLabel.backgroundColor = [UIColor blackColor];
    self.cirleLabel.layer.cornerRadius = _k_h/3/2;
    self.cirleLabel.textAlignment = NSTextAlignmentCenter;
    self.cirleLabel.numberOfLines = 0;
    self.cirleLabel.text = @"500\n";
    self.cirleLabel.textColor = RGBColor(232, 178, 84);
    self.cirleLabel.layer.borderColor = RGBColor(68, 68, 68).CGColor;
    self.cirleLabel.layer.borderWidth = 5.f;
    self.cirleLabel.clipsToBounds = YES;
    if (_k_w <= 375) {
        self.cirleLabel.font = [UIFont boldSystemFontOfSize:35];
    }else{
        self.cirleLabel.font = [UIFont boldSystemFontOfSize:50];
    }
    
    self.cirleLabel.clipsToBounds = YES;
    [self.homeBgView addSubview:self.cirleLabel];
    
    self.textLabel.backgroundColor = [UIColor clearColor];
    self.textLabel.textAlignment = NSTextAlignmentCenter;
    self.textLabel.numberOfLines = 4;
    self.textLabel.clipsToBounds = YES;
    self.textLabel.text = @"\n\n信用良好\n评估时间:2016.03.23";
    if (_k_w <= 375) {
        self.textLabel.font = [UIFont systemFontOfSize:12];
    }else{
        self.textLabel.font = [UIFont systemFontOfSize:15];
    }

    self.textLabel.textColor = RGBColor(102, 102, 102);
    [self.homeBgView addSubview:self.textLabel];
    
    
    NSMutableAttributedString *att = [[NSMutableAttributedString alloc] initWithString:self.textLabel.text];
    if (_k_w <= 375) {
        [att addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:15] range:NSMakeRange(2, 4)];
    }else{
        [att addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:20] range:NSMakeRange(2, 4)];
    }
    
    [att addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithCGColor:RGBColor(232, 178, 84).CGColor] range:NSMakeRange(2, 4)];
    self.textLabel.attributedText = att;
    
    CAShapeLayer *circleLayer = [CAShapeLayer layer];
    //指定frame，只是为了设置宽度和高度
    circleLayer.frame = CGRectMake(0, 0,  _k_h/3 -5,  _k_h/3 -5);
    circleLayer.position = CGPointMake(_k_w / 2.0, _k_h/6 + 45);
    circleLayer.fillColor = [UIColor clearColor].CGColor;
    circleLayer.lineWidth = 5.0;
    circleLayer.strokeColor = RGBColor(232, 178, 84).CGColor;
    circleLayer.lineJoin = kCALineJoinBevel;
    circleLayer.lineCap = kCALineCapRound;
    //使用UIBezierPaht创建路径
    CGRect frame = CGRectMake(0, 0,  _k_h/3 - 5,  _k_h/3 - 5);
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
//    DLog(@"%f---%f",self.loadingLayer.strokeStart,self.loadingLayer.strokeEnd);

            self.loadingLayer.strokeEnd += 0.008;

    CGFloat tq = (0.85 - 0.375)/0.008;
    CGFloat tt = 500/tq;
//    DLog(@"itime = %ld ==%.0f==%.0f",(long)_itime,tt,tq);
    self.cirleLabel.text = [NSString stringWithFormat:@"%.0f\n",tt * (_itime ++)];

        if ( self.loadingLayer.strokeEnd >= 0.85 || _itime >= (NSInteger)tq) {
//            DLog(@"ajglg=%.0f",_timer);
            self.cirleLabel.text = [NSString stringWithFormat:@"500\n"];
            self.loadingLayer.strokeStart = 0.375;
            self.loadingLayer.strokeEnd = 0.85;
            _itime = 0;
            [self.timer invalidate];
            self.timer = nil;
        }
    
}

#pragma mark ->action
-(void)tapClik:(UITapGestureRecognizer *)tap{
    NSInteger tagview = [tap view].tag;
//    DLog(@"%ld---",(long)tagview);
//    GetMoneyViewController
    NSArray *viewControllArray = @[@"RapidLoanViewController",
                                   @"CheckCreditViewController",
                                   @"BankCardViewController",
                                   @"CheckSocialSecurityViewController",
                                   @"CompetitionAmountViewController",
                                   @"ShowProvidentFundViewController"];
    Class classViews=NSClassFromString(viewControllArray[tagview - 200]);
    UIViewController *uvc=[[classViews alloc] init];
    [self.navigationController pushViewController:uvc animated:YES];
}

@end
