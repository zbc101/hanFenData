//
//  AppDelegate.m
//  hanFenData
//
//  Created by zhangbaochuan on 16/5/11.
//  Copyright © 2016年 zbc. All rights reserved.
//

#import "AppDelegate.h"
#import "LunchViewController.h"
#import "LoginViewController.h"
#import "RegisterViewController.h"

#import <ShareSDK/ShareSDK.h>
#import <ShareSDKConnector/ShareSDKConnector.h>

#import <TencentOpenAPI/TencentOAuth.h>
#import <TencentOpenAPI/QQApiInterface.h>

#import <WXApi.h>
#import <WeiboSDK.h>


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    self.window.rootViewController = [UIViewController new];
    
    //    BOOL isFirst = [LunchViewController canShowNewFeature];
    BOOL isFirst = 1;
    if (isFirst) {
        self.window.rootViewController = [LunchViewController newLunchVCWithModels:@[@"guide_01",@"guide_02",@"guide_03"] enterBlock:^{
            
            DLog(@"%@----",self.window.rootViewController);
            self.window.rootViewController =[[UINavigationController alloc] initWithRootViewController:[LoginViewController newLoginVCWithLoginenterBlock:^{
                [self enter];
            }]];
            DLog(@"%@----",self.window.rootViewController);
        } regisiterBlock:^{
            self.window.rootViewController =[[UINavigationController alloc] initWithRootViewController:[RegisterViewController newRegisiterVCWithRegistring:@"注册" LoginenterBlock:^{
                [self enter];
            }]];
            
        }];
    }
    else {
        BOOL TureLogin = 0;
        if (TureLogin) {
            [self enter];
        }else{//没有登陆并且不是第一次进入
            self.window.rootViewController =[[UINavigationController alloc] initWithRootViewController:[LoginViewController newLoginVCWithLoginenterBlock:^{
                [self enter];
            }]];
        }
        
        
    }
    
    [self shareSDk];
    
    
    return YES;
}

-(void)enter{
    
    DLog(@"启动................");
    NSUUID *uiid = [NSUUID UUID];
    
    DLog(@"%f==%@ ==%@",kIOS_VERSION, [[UIDevice currentDevice] identifierForVendor], uiid.UUIDString);
    
    self.btb = [[BaseTabBarViewController alloc]init];
    self.window.rootViewController = self.btb;
}

-(void)shareSDk{
    [ShareSDK registerApp:@"1318052d7fb74" activePlatforms:@[@(SSDKPlatformTypeSinaWeibo),
                                                             @(SSDKPlatformTypeSMS),
                                                             @(SSDKPlatformSubTypeWechatTimeline),
                                                             @(SSDKPlatformSubTypeWechatSession),
                                                             @(SSDKPlatformSubTypeQQFriend),
                                                             @(SSDKPlatformSubTypeQZone),
                                                             @(SSDKPlatformTypeCopy)]
                 onImport:^(SSDKPlatformType platformType) {
                     switch (platformType)
                     {
                         case SSDKPlatformTypeWechat:
                             [ShareSDKConnector connectWeChat:[WXApi class]];
                             break;
                         case SSDKPlatformTypeQQ:
                             [ShareSDKConnector connectQQ:[QQApiInterface class] tencentOAuthClass:[TencentOAuth class]];
                             break;
                         case SSDKPlatformTypeSinaWeibo:
                             [ShareSDKConnector connectWeibo:[WeiboSDK class]];
                             break;
                         default:
                             break;
                             
                     }} onConfiguration:^(SSDKPlatformType platformType, NSMutableDictionary *appInfo) {
                         switch (platformType)
                         {
                             case SSDKPlatformTypeSinaWeibo:
                                 //设置新浪微博应用信息,其中authType设置为使用SSO＋Web形式授权
                                 [appInfo SSDKSetupSinaWeiboByAppKey:@"634140413"
                                                           appSecret:@"49cfa168cc7892724dda804a642b3ce0"
                                                         redirectUri:@"http://www.sharesdk.cn"
                                                            authType:SSDKAuthTypeBoth];
                                 break;
                             case SSDKPlatformTypeWechat:
                                 [appInfo SSDKSetupWeChatByAppId:@"wxc61191fc58c386fa"
                                                       appSecret:@"81bdb542d3346a247fbb50e15b165164"];
                                 break;
                             case SSDKPlatformTypeQQ:
                                 [appInfo SSDKSetupQQByAppId:@"1105422922"
                                                      appKey:@"7SALGgKDxlBFy8wK"
                                                    authType:SSDKAuthTypeBoth];
                                 
                                 break;
                             default:
                                 break;
                         }
                     }];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
