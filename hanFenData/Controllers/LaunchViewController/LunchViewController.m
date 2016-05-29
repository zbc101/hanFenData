//
//  LunchViewController.m
//  Lunch
//
//  Created by dd on 16/3/15.
//  Copyright © 2016年 dd. All rights reserved.
//

#import "LunchViewController.h"

NSString *const NewFeatureVersionKey = @"NewFeatureVersionKey";

@interface LunchViewController () <UIScrollViewDelegate>

@property (nonatomic,copy) void(^enterBlock)();
@property (nonatomic, copy) void(^regisiterBlock)();

@property (strong, nonatomic) UIScrollView *scrollView;

@property (strong, nonatomic) UIPageControl *pageControl;

@property (strong, nonatomic) UIButton *btn;

@property (strong, nonatomic) NSArray *imageArr;


@property (strong, nonatomic) NSArray *backgroundViews;



@end

@implementation LunchViewController

+ (instancetype)newLunchVCWithModels:(NSArray *)models enterBlock:(void(^)())enterBlock {
    LunchViewController *newLunchVC = [[LunchViewController alloc] init];
    newLunchVC.imageArr = models;
    
    newLunchVC.enterBlock = enterBlock;
    
    
    return newLunchVC;
}

+ (instancetype)newLunchVCWithModels:(NSArray *)models enterBlock:(void(^)())enterBlock regisiterBlock:(void (^)())regisiterBlock{
    LunchViewController *newLunchVC = [[LunchViewController alloc] init];
    newLunchVC.imageArr = models;
    
    newLunchVC.enterBlock = enterBlock;
    newLunchVC.regisiterBlock = regisiterBlock;
    return newLunchVC;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    
    [self saveVersion];
    [self initScrollview];
    [self initImageView];
    [self addCustomPage];
    [self addButton];
}


- (void)initScrollview
{
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, screenSize.width, screenSize.height)];
    
    _scrollView.contentSize = CGSizeMake(screenSize.width * _imageArr.count, screenSize.height);
    
    _scrollView.alwaysBounceHorizontal = YES;
    _scrollView.pagingEnabled = YES;
    _scrollView.delegate = self;
    _scrollView.showsHorizontalScrollIndicator = NO;
    
    
    [self.view addSubview:_scrollView];
}

- (void)initImageView
{
    NSMutableArray *tmpArr = [NSMutableArray array];
    for (int i = 0; i < _imageArr.count; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(i * _k_w, 0, _k_w, _k_h)];
        imageView.image = [UIImage imageNamed:[_imageArr objectAtIndex:i]];
        [tmpArr addObject:imageView];
        [self.scrollView addSubview:imageView];
    }
    
    self.backgroundViews = [[tmpArr reverseObjectEnumerator] allObjects];
}

- (void)addCustomPage
{
    _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(_k_w/2 -50, _k_h - 150, 100, 50)];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 20)];
    _pageControl.pageIndicatorTintColor = RGBColorAlpha(198, 140, 64, 0.3);
    _pageControl.currentPageIndicatorTintColor = RGBColorAlpha(232, 178, 84, 1);
    _pageControl.numberOfPages = _imageArr.count;
    [view addSubview:_pageControl];
    [self.view addSubview:view];
}

- (void)addButton
{
    
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(18, _k_h - 100, (_k_w- 54)/2, 51);
    [btn setBackgroundColor:RGBColorAlpha(232, 178, 84, 1)];
    btn.layer.cornerRadius = 5;
    [btn setTitle:@"登录" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
     btn.titleLabel.font = [UIFont systemFontOfSize:25];
    [self.view addSubview:btn];
    
    UIButton *btnRegisiter = [UIButton buttonWithType:UIButtonTypeCustom];
    btnRegisiter.frame = CGRectMake((_k_w- 54)/2 + 36, _k_h - 100,(_k_w- 54)/2, 51);
    [btnRegisiter setBackgroundColor:[UIColor whiteColor]];
    btnRegisiter.layer.borderWidth = 1;
    btnRegisiter.layer.borderColor = [UIColor grayColor].CGColor;
    btnRegisiter.layer.cornerRadius = 5;
    [btnRegisiter setTitle:@"注册" forState:UIControlStateNormal];
    [btnRegisiter setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    btnRegisiter.titleLabel.font = [UIFont systemFontOfSize:25];
    [btnRegisiter addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnRegisiter];
    
}

-(void)btnClick{
  
    if (self.regisiterBlock != nil) {
        [UIView animateWithDuration:1.0 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            self.view.alpha = 0;
        } completion:^(BOOL finished) {
            [self.view removeFromSuperview];
            
            _regisiterBlock();
            
        }];
        
    }

}
//登陆
- (void)click
{
    
    if (self.enterBlock != nil) {
//        LoginViewController *longinVC = [LoginViewController new];
//        longinVC.delegate = self;
//        [self presentViewController:longinVC animated:YES completion:^{
////            [self.view removeFromSuperview];
////            _enterBlock();
//        }];
        
        [UIView animateWithDuration:1.0 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            self.view.alpha = 0;
        } completion:^(BOOL finished) {
            [self.view removeFromSuperview];
            
            _enterBlock();
            
        }];
        
    }
}



-(void)saveVersion{
    
    //系统直接读取的版本号
    NSString *versionValueStringForSystemNow = [[NSBundle mainBundle].infoDictionary valueForKey:(NSString *)kCFBundleVersionKey];
    //保存版本号
    [[NSUserDefaults standardUserDefaults] setObject:versionValueStringForSystemNow forKey:NewFeatureVersionKey];
}


+(BOOL)canShowNewFeature{
    
    //系统直接读取的版本号
    NSString *versionValueStringForSystemNow=[[NSBundle mainBundle].infoDictionary valueForKey:(NSString *)kCFBundleVersionKey];
    
    //读取本地版本号
    NSString *versionLocal = [[NSUserDefaults standardUserDefaults] objectForKey:NewFeatureVersionKey];
    
    if(versionLocal!=nil && [versionValueStringForSystemNow isEqualToString:versionLocal]){//说明有本地版本记录，且和当前系统版本一致
        
        return NO;
        
    }else{//无本地版本记录或本地版本记录与当前系统版本不一致
        
        //保存
        [[NSUserDefaults standardUserDefaults] setObject:versionValueStringForSystemNow forKey:NewFeatureVersionKey];
        
        return YES;
    }
}


#pragma mark --ScrollViewDelegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger page = scrollView.contentOffset.x / _k_w;
    self.pageControl.currentPage = page;
}

//- (void)scrollViewDidScroll:(UIScrollView *)scrollView
//{
//    NSInteger index = scrollView.contentOffset.x / _k_w;
//    CGFloat alpha = 1- ((scrollView.contentOffset.x - index * _k_w) / _k_w);
//    
//    self.pageControl.currentPage = index;
//    if (self.imageArr.count > index) {
//        UIView *v = [self.backgroundViews objectAtIndex:index];
//        if (v) {
//            [v setAlpha:alpha];
//        }
//    }
//}



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


@end
