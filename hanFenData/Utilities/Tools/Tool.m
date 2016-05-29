//
//  Tool.m
//  fxdProduct
//
//  Created by dd on 15/9/16.
//  Copyright (c) 2015年 dd. All rights reserved.
//

#import "Tool.h"
#import "DES3Util.h"
#import <objc/runtime.h>

@implementation Tool

//获取加密参数
+ (NSDictionary *)getParameters:(id)params
{
    return @{@"record":[self getEncryptStringWithParameters:params]};
}

//加密json串
+ (NSString *)getEncryptStringWithParameters:(id)params
{
    NSError *error = nil;
    NSString *jsonString;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:params options:NSJSONWritingPrettyPrinted error:&error];
    if (error) {
        DLog(@"[net]GotParams: %@",error);
    } else {
        jsonString = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    
    NSString *enValues = [DES3Util encrypt:jsonString];
    return enValues;
}
+ (NSString *)dataToStringwithdata:(id)params
{
    NSString *result  =[[ NSString alloc] initWithData:params encoding:NSUTF8StringEncoding];
    return result;
}

+ (NSDictionary *)dataToDictionary:(id)params
{
//    NSString *receiveStr = [params objectForKey:@"record"];
//    NSString *decStr = [DES3Util decrypt:receiveStr];
//    DLog(@"---%@",decStr);
    NSData * data = [params dataUsingEncoding:NSUTF8StringEncoding];
    
    NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    
    return jsonDict;
}

#pragma mark- 时间处理

+ (NSString *)getToday
{
    NSDate *date = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString *dateStr = [formatter stringFromDate:date];
    return dateStr;
}
+ (NSString *)getNowTime
{
    NSDate *date = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    NSString *dateStr = [formatter stringFromDate:date];
    return dateStr;
}
//将时间转换为时间戳
+ (NSTimeInterval)timeToTimestamp:(NSString *)timeStr
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    NSDate *date = [formatter dateFromString:timeStr];
    NSTimeInterval timesp = [date timeIntervalSince1970];
    formatter = nil;
    return timesp;
}

//时间戳转换为时间
+ (NSString *)timestampToTime:(NSTimeInterval)timestamp
{
    //    NSString *longOftimesTamp = [NSString stringWithFormat:@"%.0lf", timestamp];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    NSDate *date = nil;
    //    if (longOftimesTamp.length > 10) {
    date  = [NSDate dateWithTimeIntervalSince1970:timestamp];
    //    }else{
    //        date  = [NSDate dateWithTimeIntervalSince1970:timestamp];
    //    }
    NSString *timeStr = [formatter stringFromDate:date];
    formatter = nil;
    return timeStr;
}


//判断字典是否有某key值
+(BOOL)dicContainsKey:(NSDictionary *)dic keyValue:(NSString *)key
{
    if ([self objectIsEmpty:dic]) {
        return NO;
    }
    
    NSArray *keyArray = [dic allKeys];
    
    if ([keyArray containsObject:key]) {
        
        return YES;
    }
    return NO;
}

//判断对象是否为空
+(BOOL)objectIsEmpty:(id)object
{
    if ([object isEqual:[NSNull null]]) {
        return YES;
    }
    else if ([object isKindOfClass:[NSNull class]])
    {
        return YES;
    }
    else if (nil == object){
        return YES;
    }
    return NO;
}

+(NSString *)EmptyObjectContainEmptyString:(id)object
{
    if ([self objectIsEmpty:object]) {
        return @"";
    }
    else
    {
        return object;
    }
}

//判断手机号是否有效
+ (BOOL)isMobileNumber:(NSString *)mobileNum
{
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188,147,183
     * 联通：130,131,132,152,155,156,185,186
     * 电信：133,1349,153,180,189,181
     */
    NSString * MOBILE = @"^1(3[0-9]|4[57]|5[0-35-9]|7[0-9]|8[0-9])\\d{8}$";
    /**
     10         * 中国移动：China Mobile
     11         * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188，183
     12         */
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    /**
     15         * 中国联通：China Unicom
     16         * 130,131,132,152,155,156,185,186
     17         */
    NSString * CU = @"^1(3[0-2]|5[256]|8[156])\\d{8}$";
    /**
     20         * 中国电信：China Telecom
     21         * 133,1349,153,180,189
     22         */
    NSString * CT = @"^1((33|53|8[09])[0-9]|349)\\d{7}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    
    if (([regextestmobile evaluateWithObject:mobileNum] == YES)
        || ([regextestcm evaluateWithObject:mobileNum] == YES)
        || ([regextestct evaluateWithObject:mobileNum] == YES)
        || ([regextestcu evaluateWithObject:mobileNum] == YES))
    {
        return YES;
    }
    else {
        return NO;
    }
}

//设置沙盒
+ (void)saveUserDefaul:(NSString *)content Key:(NSString *)key;
{
    [[NSUserDefaults standardUserDefaults] setObject:content forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (NSString *)getContentWithKey:(NSString *)key;
{
    
    return [[NSUserDefaults standardUserDefaults] objectForKey:key];
}


//圆角设置
+(void)setCorner:(UIView *)view borderColor:(UIColor *)color
{
    view.layer.cornerRadius = 8;
    view.layer.masksToBounds = YES;
    view.layer.borderWidth = 1;
    view.layer.borderColor = color.CGColor;
}
+(void)setCornerWithoutRadius:(UIView *)view borderColor:(UIColor *)color
{
    view.layer.cornerRadius = 0;
    view.layer.masksToBounds = YES;
    view.layer.borderWidth = 1;
    view.layer.borderColor = color.CGColor;
}

@end
