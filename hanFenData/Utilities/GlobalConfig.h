//
//  GlobalConfig.h
//  hanFenDate
//
//  Created by zhangbaochuan on 16/5/10.
//  Copyright © 2016年 zbc. All rights reserved.
//

#ifndef GlobalConfig_h
#define GlobalConfig_h

#ifdef DEBUG
//#define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#define DLog(fmt, ...) NSLog((@"[文件名:%s]\n" "[函数名:%s]\n" "[行号:%d] \n" fmt), __FILE__, __FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#define DLog(...)
#endif

#pragma mark - 设备信息

#define kIOS_VERSION    [[[UIDevice currentDevice] systemVersion] floatValue]

// 设置三原色
#define RGBColor(R,G,B) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:1.0]
#define RGBColorAlpha(R,G,B,A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]

#define _k_view_width    self.view.frame.size.width
#define _k_view_height   self.view.frame.size.height
#define _k_w           [UIScreen mainScreen].bounds.size.width
#define _k_h           [UIScreen mainScreen].bounds.size.height

#pragma mark - 是否为空或是[NSNull null]

#define kNotNilAndNull(_ref)  (((_ref) != nil) && (![(_ref) isEqual:[NSNull null]]))

#define kIsNilOrNull(_ref)   (((_ref) == nil) || ([(_ref) isEqual:[NSNull null]]))



#define   _main_url                            @"http://192.168.6.130:9191/fxd-esb/esb/"


#endif /* GlobalConfig_h */
