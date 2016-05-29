//
//  CompetitionAmountViewController.m
//  hanFenData
//
//  Created by zhangbaochuan on 16/5/13.
//  Copyright © 2016年 zbc. All rights reserved.
//

#import "CompetitionAmountViewController.h"
#import "AmountPlatCell.h"

@interface CompetitionAmountViewController ()<UIScrollViewDelegate,UIPageViewControllerDelegate,UIPageViewControllerDataSource>

@property (nonatomic, strong) UIScrollView *scrollview;
@property (nonatomic, strong) UIView *indicatorView;
@property (nonatomic, strong) UIPageViewController *pageVC;
@property (nonatomic, strong) NSMutableArray *vcArray;
@property (nonatomic, assign) NSInteger curPage;
@property (nonatomic, strong) UIButton *btn1;
@property (nonatomic, strong) UIButton *btn2;
@end

@implementation CompetitionAmountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"额度大比拼";
    
    [self CreateAddVC];
    [self initCreatePageViewController];
    [self createTopScrollvewe];
    [self createButtomUIview];
    self.view.backgroundColor = RGBColor(239, 239, 239);
    
}

-(void)createButtomUIview{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, _k_h - 50, _k_w, 50)];
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
    
    UIView *viewSepor = [[UIView alloc] initWithFrame:CGRectMake(0, 0, _k_w, 1)];
    viewSepor.backgroundColor = RGBColor(239, 239, 239);
    [view addSubview:viewSepor];
    
    UILabel *labelNum = [[UILabel alloc] initWithFrame:CGRectMake(24, 1, 35, 49)];
    labelNum.text = @"35";
    labelNum.font = [UIFont systemFontOfSize:22];
    labelNum.textColor = RGBColor(195, 195, 195);
    [view addSubview:labelNum];
    
    UIImageView *iamgeViewIcon = [[UIImageView alloc] initWithFrame:CGRectMake(70, 3, 45, 45)];
    iamgeViewIcon.image = [UIImage imageNamed:@"20160514_icon"];
    [view addSubview:iamgeViewIcon];
    
    UIImageView *iconIndex = [[UIImageView alloc] initWithFrame:CGRectMake(_k_w -23, 19, 13, 13)];
    iconIndex.image = [UIImage imageNamed:@"03_tie_03_icon01"];
    [view addSubview:iconIndex];
    
    UILabel *labeldetail = [[UILabel alloc] initWithFrame:CGRectMake(_k_w - 63-5, 1, 40, 49)];
    labeldetail.text = @"提升";
    labeldetail.textColor = RGBColor(195, 195, 195);
    labeldetail.font = [UIFont systemFontOfSize:14];
    labeldetail.textAlignment = NSTextAlignmentRight;
    [view addSubview:labeldetail];
    
    UILabel *numAmountLabel = [[UILabel alloc] initWithFrame:CGRectMake(_k_w - 150, 1, 80, 49)];
    numAmountLabel.text = @"1000";
    numAmountLabel.textColor = RGBColor(221, 160, 66);
    numAmountLabel.font = [UIFont systemFontOfSize:25];
    [view addSubview:numAmountLabel];
}
-(void)createTopScrollvewe
{
    _scrollview=[[UIScrollView alloc] initWithFrame:CGRectMake(0, 80, _k_w, 44)];
    _scrollview.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_scrollview];
    
    NSArray *array=@[@"朋友圈",@"平台"];
    
    _btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    _btn1.frame = CGRectMake(0, 0, 414/2, 42);
    [_btn1 setBackgroundColor:[UIColor clearColor]];
    [_btn1 setTitle:array[0] forState:UIControlStateNormal];
    [_btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _btn1.titleLabel.font = [UIFont systemFontOfSize:17];
    [_scrollview addSubview:_btn1];
    _btn1.tag = 10;
    [_btn1 addTarget:self action:@selector(changeVC:) forControlEvents:UIControlEventTouchUpInside];
    
    _btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    _btn2.frame = CGRectMake(414/2, 0, 414/2, 42);
    [_btn2 setBackgroundColor:[UIColor clearColor]];
    [_btn2 setTitle:array[1] forState:UIControlStateNormal];
    [_btn2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _btn2.titleLabel.font = [UIFont systemFontOfSize:17];
    [_scrollview addSubview:_btn2];
    _btn2.tag = 11;
    [_btn2 addTarget:self action:@selector(changeVC:) forControlEvents:UIControlEventTouchUpInside];
    
    _scrollview.contentSize=CGSizeMake(414, 44);
    
    _indicatorView =[[UIView alloc] initWithFrame:CGRectMake(0, 42, 414/2, 2)];
    _indicatorView.backgroundColor=RGBColor(221, 160, 66);
    _indicatorView.alpha=1;
    [_scrollview addSubview:_indicatorView];
    _scrollview.tag=100;
    _scrollview.backgroundColor=[UIColor whiteColor];
    
    
}

- (void)changeVC:(UIButton *)btn
{
    //获取当前第几页
    
    NSInteger tag = btn.tag - 10;
    
    [_pageVC setViewControllers:@[_vcArray[tag]] direction:tag<_curPage animated:YES completion:^(BOOL finished) {
        _curPage=tag;
//        NSLog(@"_curPage==tag=%ld",_curPage);
        
        
    }];
}

-(void)CreateAddVC{

    _vcArray = [NSMutableArray array];
    NSArray *arr=@[@"CompetionFriendsroundViewController",@"CompetitionPlatFormViewController"];
    for (NSString *className in arr) {
        Class cla = NSClassFromString(className);
        id vc = [[cla alloc] init];
        [_vcArray addObject:vc];
    }
    
    
}
-(void)initCreatePageViewController{
    _pageVC = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    _pageVC.delegate = self;
    _pageVC.dataSource = self;
    [_pageVC setViewControllers:@[_vcArray[0]] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
//    _pageVC.view.frame = CGRectMake(0, 130, 414, _k_h -124 -48);
    [[_pageVC view] setFrame:CGRectMake(0, 130, _k_w, _k_h -124 -50)];
    DLog(@"-----%@",NSStringFromCGRect(_pageVC.view.frame));
    [self.view addSubview:_pageVC.view];
    for (UIView *view in _pageVC.view.subviews) {
        view.tag = 101;
        ((UIScrollView *)view).delegate = self;
    }
    [self addChildViewController:_pageVC];
}
#pragma mark -> pageViewControllDelegate
-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSInteger index=[_vcArray indexOfObject:viewController];
    if (index==_vcArray.count-1) {
        return nil;
    }
    
    return _vcArray[index+1];
}

-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    
    NSInteger index=[_vcArray indexOfObject:viewController];
    //    NSLog(@"index=%ld",index);
    if (index==0) {
        return nil;
    }
    return _vcArray[index-1];
}

-(void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray *)previousViewControllers transitionCompleted:(BOOL)completed
{
    _curPage=[_vcArray indexOfObject:_pageVC.viewControllers[0]];
    //    NSLog(@"_cupage=%ld",_curPage);
}


#pragma mark---ScrollView代理

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGRect frame=_indicatorView.frame;
    frame.origin.x=_curPage*414/2.0;
    
    _indicatorView.frame=frame;
    if (_curPage == 0) {
        [_btn1 setTitleColor:RGBColor(221, 160, 66) forState:UIControlStateNormal];
    }else{
        [_btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    if (_curPage == 1) {
        [_btn2 setTitleColor:RGBColor(221, 160, 66) forState:UIControlStateNormal];
    }else{
        [_btn2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    
    
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if (scrollView.tag==100) {
        if (_curPage == 0 || _curPage==_vcArray.count-1) {
            _scrollview.bounces = NO;
        }else{
            _scrollview.bounces = YES;
        }
        
    }
    if (scrollView.tag==101) {
        if (_curPage == 0 || _curPage==_vcArray.count-1) {
            _scrollview.bounces = NO;
        }else{
            _scrollview.bounces = YES;
        }
        
    }
    
}


@end
