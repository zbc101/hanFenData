//
//  BaseTabBarViewController.m
//  hanFenDate
//
//  Created by zhangbaochuan on 16/5/10.
//  Copyright © 2016年 zbc. All rights reserved.
//

#import "BaseTabBarViewController.h"
#import "LoginViewController.h"
#import "RegisterViewController.h"
#import "BaseNavigationController.h"

@interface BaseTabBarViewController ()<UITabBarControllerDelegate>

@end

@implementation BaseTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.delegate = self;
    [self setTabBarControl];
}

-(void)setTabBarControl{
    NSArray *viewControllArray=@[@"CreditViewController",@"ImproveViewController",@"MineViewController"];
    NSArray *titleArray=@[@"信用",@"提额",@"我的"];
    NSArray *imageArray=@[@"00_icon01",@"00_icon03",@"00_icon05"];
    NSArray *selectImageArray=@[@"00_icon02",@"00_icon04",@"00_icon06"];
    
    NSMutableArray *navArray=[NSMutableArray array];
    for (NSInteger i=0; i<viewControllArray.count; i++) {
        Class classViews=NSClassFromString(viewControllArray[i]);
        
        UIViewController *uvc=[[classViews alloc] init];
        uvc.tabBarItem.image=[[UIImage imageNamed:imageArray[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        uvc.tabBarItem.selectedImage=[[UIImage imageNamed:selectImageArray[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        uvc.tabBarItem.title=titleArray[i];
        
        BaseNavigationController *navCtronller=[[BaseNavigationController alloc] initWithRootViewController:uvc];
        
        [navArray addObject:navCtronller];
    }
    self.tabBar.tintColor = RGBColor(232, 178, 84);
    UIView *bgView = [[UIView alloc] initWithFrame:self.tabBar.bounds];
    bgView.backgroundColor = [UIColor whiteColor];
    [self.tabBar insertSubview:bgView atIndex:0];
    
    self.tabBar.opaque = YES;;
    [self.tabBar insertSubview:bgView atIndex:0];

    self.viewControllers=navArray;
}

#pragma mark--> UITabBarControllerDelegate
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
//    if (tabBarController.selectedIndex == 0) {
//        BOOL longin = 0;
//        if (longin) {
//            
//        }else{
//            LoginViewController *longinVC = [LoginViewController new];
//            [self.navigationController pushViewController:longinVC animated:YES];
//        }
//    }
}
@end
