//
//  PcrEngine.h
//  PcrEngine
//  version 1.7.7182
//  Created by R-E on 15/1/2.
//  Copyright (c) 2015年 www.kuaicha.info. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef enum
{
    KC_COLOR_TYPE_BLUE = 0,//默认蓝色
    KC_COLOR_TYPE_CUSTOM
}KC_COLOR_TYPE;//页面主色调。目前暂支持蓝色，以后版本会陆续支持多种颜色界面供开发者使用，敬请期待

typedef enum
{
    KC_PCR_ERRORCODE_NONE = 0,   //暂无报告
    KC_PCR_ERRORCODE_SUCCESS,    //获取报告成功
    KC_PCR_SHOW_REPORT_SUCCESS,  //显示报告成功
    KC_PCR_ERRORCODE_HAVENOTGET, //还未获取最新报告
    KC_PCR_ERRORCODE_APPLY,      //用户申请中
    KC_PCR_ERRORCODE_FAILED,     //获取报告失败
    KC_PCR_ERRORCODE_CANCEL,     //用户取消
    KC_PCR_ERRORCODE_UNINFORMED  //用户信息不足导致无法获取信用报告
}KC_PCR_ERRORCODE;//信用报告引擎错误类型

typedef enum
{
    KC_PCR_REPORT_NONE = 0,     //无状态
    KC_PCR_REPORT_HAVE,         //已生成
    KC_PCR_REPORT_APPLY,        //申请中
    KC_PCR_REPORT_UNINFORMED,   //用户信息不足
    KC_PCR_REPORT_LASTERROR,    //上次回答问题有误
    KC_PCR_REPORT_FAILED        //获取失败
    
    
}KC_PCR_REPORT_STATE;//信用报告的状态

@interface PcrEngine : NSObject

#pragma mark - 引擎版本号
+(NSString*)version;

#pragma mark 进入获取个人信用报告页面
/** 进入获取个人信用报告页面.

 @param  superViewController
 父viewController
 
 @param  ViewColorType
 页面主色。(目前暂支持蓝色KC_COLOR_TYPE_BLUE，后续版本会陆续支持多种颜色选项
 供开发者使用，敬请期待)
 
 @param  appKey
 在www.kuaicha.info上申请获取的AppKey
 
 @param  responeBlock
 从信用查询页面返回您的程序页面时所要执行的block方法
 @param  errorCode         //错误类型
 @param  creditReportDic   //信用报告
 */
+(void)getPersonalCreditReport:(UIViewController*)superViewController
                 ViewColorType:(KC_COLOR_TYPE)viewColorType
                        AppKey:(NSString *)appKey
                  ResponeBlock:(void(^)(KC_PCR_ERRORCODE errorCode,NSDictionary *creditReportDic))responeBlock;


#pragma mark 指定获取特定身份证号的信用报告
/** 进入获取个人信用报告页面.指定获取特定身份证号的信用报告

 @param  superViewController
 父viewController
 
 @param  ViewColorType
 页面主色。(目前暂支持蓝色KC_COLOR_TYPE_BLUE，后续版本会陆续支持多种颜色选项
 供开发者使用，敬请期待)
 
 @param  appKey
 在www.kuaicha.info上申请获取的AppKey
 
 @param  idCardNum
 身份证号
 
 @param  timeliness
 获取该用户生成信用报告的时效性（单位：天，取值范围>=0）
 即：要求获取最近timeliness天内的信用报告
 
 @param block返回：
 @param  errorCode         //错误类型
 @param  creditReportDic   //信用报告
 */

+(void)getPersonalCreditReport:(UIViewController*)superViewController
                 ViewColorType:(KC_COLOR_TYPE)viewColorType
                        AppKey:(NSString *)appKey
                      IDnumber:(NSString*)IDnumber
                    Timeliness:(int)timeliness
                  ResponeBlock:(void(^)(KC_PCR_ERRORCODE errorCode,NSDictionary *creditReportDic))responeBlock;


#pragma mark 高级接口
/*自定义界面的主色调
 
 1.仅当viewColorType为KC_COLOR_TYPE_CUSTOM时,该函数设置才生效，
 2.须在getPersonalCreditReport函数之前调用。
 3.如有需要，ImageMaterial.bundle包里对应的图片可替换掉
 */
+(void)setCustomColor:(UIColor *)customColor;

/*传入数据就可展示信用报告
 
 @param  reportDic
 传入的信用报告数据
 
 */
+(void)showPersonalCreditReport:(NSDictionary *)reportDic;

@end



