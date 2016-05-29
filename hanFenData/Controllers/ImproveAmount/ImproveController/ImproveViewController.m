//
//  ImproveViewController.m
//  hanFenDate
//
//  Created by zhangbaochuan on 16/5/10.
//  Copyright © 2016年 zbc. All rights reserved.
//

#import "ImproveViewController.h"
#import "PerfectIdentityViewController.h"
#import "MinelistCell.h"

@interface ImproveViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UILabel *bigCircleLabel;//外大圆
@property (nonatomic, strong) UILabel *cirleLabel;//内灰圆
@property (nonatomic, strong) UILabel *textLabel;//内容二、三
@property (nonatomic, strong) CAShapeLayer *loadingLayer;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, assign) NSInteger itime;
@property (nonatomic, strong) UIView *homeBgView;
@property (nonatomic, strong) NSArray *imageArr;
@property (nonatomic, strong) NSArray *titleArr;
@property (nonatomic, strong) NSArray *textLabelArr;


@end

@implementation ImproveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.fd_prefersNavigationBarHidden = YES;
    self.titleArr = @[@"完善身份信息",@"征信数据认证",@"电商数据认证",@"好友互动"];
    self.textLabelArr = @[@"提高借款额度",@"加快审核速度",@"提高借款额度",@"加快审核速度"];
    CGFloat heiBg = (35 + _k_h/3 +20 + 19 + 60);
    self.homeBgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, _k_w, heiBg)];
    self.homeBgView.backgroundColor =[UIColor colorWithPatternImage:[UIImage imageNamed:@"02_home_bj"]];
    self.bigCircleLabel = [[UILabel alloc] initWithFrame:CGRectMake((_k_w - _k_h/3 - 20)/2.f, 35, _k_h/3 + 20, _k_h/3 +20)];
    self.cirleLabel = [[UILabel alloc] initWithFrame:CGRectMake((_k_w -  _k_h/3)/2.f, 45,  _k_h/3,  _k_h/3)];
    self.textLabel = [[UILabel alloc] initWithFrame:CGRectMake((_k_w -  _k_h/3 + 20)/2.f, 55, _k_h/3-20, _k_h/3-20)];
//    self.view.backgroundColor = [UIColor blackColor];
    
    [self.view addSubview:_homeBgView];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, heiBg - 79, _k_w, 79)];
    label.text = @"完成以下任务可快速提升您的\n借款额度和审核速度";
    label.textAlignment = NSTextAlignmentCenter;
    label.numberOfLines = 0;
    label.textColor = [UIColor grayColor];
    label.font = [UIFont systemFontOfSize:15];
    [self.homeBgView addSubview:label];
    
    self.automaticallyAdjustsScrollViewInsets = YES;
    UITableView *tableV = [[UITableView alloc] initWithFrame:CGRectMake(0, heiBg+20, _k_w, _k_h - heiBg - 49 - 20) style:UITableViewStyleGrouped];
    tableV.delegate = self;
    tableV.dataSource = self;
    tableV.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tableV];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
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

#pragma mark ->UITableViewDataSource,UITableViewDelegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cell1 = @"cell1";
    MinelistCell *cell = [tableView dequeueReusableCellWithIdentifier:cell1];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"MinelistCell" owner:self options:nil] lastObject];
    }
    
    cell.imageviewicon.image = [UIImage imageNamed:[NSString stringWithFormat:@"03_tie_01_icon0%ld",indexPath.row + 1]];
    
    cell.labelTitle.text =_titleArr[indexPath.row];
    
    cell.lableDetailTitle.text = _textLabelArr[indexPath.row];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 48;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.1;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSArray *viewControllArray = @[@"PerfectIdentityViewController",
                                   @"CreditDataSureViewController",
                                   @"ElectricitySupplierDataViewController",
                                   @"FriendsInteractiveViewController"];
    Class classViews=NSClassFromString(viewControllArray[indexPath.row]);
    UIViewController *uvc=[[classViews alloc] init];
    [self.navigationController pushViewController:uvc animated:YES]; 
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
    DLog(@"%f---%f",self.loadingLayer.strokeStart,self.loadingLayer.strokeEnd);
    
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

@end
