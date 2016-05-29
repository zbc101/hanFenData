//
//  MyAboutOursViewController.m
//  fxdProduct
//
//  Created by zhangbaochuan on 15/11/10.
//  Copyright © 2015年 dd. All rights reserved.
//

#import "MyAboutOursViewController.h"

@interface MyAboutOursViewController ()

@end

@implementation MyAboutOursViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RGBColorAlpha(245, 245, 245, 1);
    [self addBackItem];
    [self createUI];
    
}

-(void)createUI{
    self.title=@"关于我们";
    UIImage *imagelogo=[UIImage imageNamed:@"04_my_02_icon08"];
    CGFloat logoHeight = 114;
    CGFloat logoWeight = 114;
    UIImageView *logoimageView=[[UIImageView alloc] initWithFrame:CGRectMake((_k_w-logoWeight)/2, 94, logoWeight, logoHeight)];
    logoimageView.image=imagelogo;
    [self.view addSubview:logoimageView];
    
    UILabel *label=[[UILabel alloc] initWithFrame:CGRectMake(0, logoimageView.frame.size.height+logoimageView.frame.origin.y+17, _k_w, 25)];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor lightGrayColor];
    label.font = [UIFont systemFontOfSize:17];
    label.text= @"憨分·信用传递价值";
    [self.view addSubview:label];
    
    UIWebView *webView=[[UIWebView alloc]initWithFrame:CGRectMake(0,label.frame.origin.y+label.frame.size.height+33 , _k_w, _k_h-label.frame.origin.y+label.frame.size.height-33)];
    webView.backgroundColor=RGBColorAlpha(245, 245, 245, 1);
    [webView loadHTMLString:@"<br><span style='font-size:15px'>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp憨分数据科技(上海)有限公司成立于2016年，总部位于上海，是中赢金融（股权代码：203767）的全资子公司。<p>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp憨分专注于数据以及信用挖掘，致力于搭建专业化的信贷数据平台，依托大数据金融，为客户提供增信额度，实现提现、分期消费等金融信贷体验服务，同时可以享受租赁、购物等便捷生活消费服务，以及信用赚钱、生活预测等服务。通过产品和服务分层，为客户提供24小时在线金融信贷服务。</span>" baseURL:nil];
    [self.view addSubview:webView];
}

-(void)tapClick{

    UIAlertController *alertCon=[UIAlertController alertControllerWithTitle:@"" message:@"工作时间：9：00~17：30" preferredStyle:UIAlertControllerStyleActionSheet];
    [alertCon addAction:[UIAlertAction actionWithTitle:@"☎️400-088-0888" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSURL *telURL = [NSURL URLWithString:[NSString stringWithFormat:@"tel://%@", @"400-088-0888"]];
        [[UIApplication sharedApplication] openURL:telURL];
    }]];
    [alertCon addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }]];
    [self presentViewController:alertCon animated:YES completion:nil];
}

//隐藏与现实tabbar
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
    self.tabBarController.tabBar.hidden=YES;
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.tabBarController.tabBar.hidden=NO;
}

@end
