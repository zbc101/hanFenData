//
//  NetAccessor.m
//  NetRequestEncapsulation
//
//  Created by dd on 16/5/19.
//  Copyright © 2016年 dd. All rights reserved.
//

#import "NetAccessor.h"

@implementation NetAccessor

+ (instancetype)sharedInstance
{
    static NetAccessor *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (void)sendPostObjectFormUrl:(NSString *)urlStr parameters:(id)parameters progress:(ProgressBlock)progress finished:(FinishedBlock)finished
{
    NSString *partURL = [@"" stringByAppendingString:@""];
    NSString *URLString = [partURL stringByAppendingString:urlStr];
    if (parameters) {
       
    }
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain",@"text/xml",@"text/html",@"application/x-www-form-urlencoded",@"application/json", @"text/json", @"text/javascript",@"charset=UTF-8", nil];
    manager.requestSerializer.timeoutInterval = 20.0;
    
    [AFNetworkActivityIndicatorManager sharedManager].enabled = YES;
    [manager POST:URLString parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        progress(uploadProgress);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        finished(Enum_SUCCESS,responseObject);
        [AFNetworkActivityIndicatorManager sharedManager].enabled = NO;
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        finished(Enum_FAIL,error);
        [AFNetworkActivityIndicatorManager sharedManager].enabled = NO;
    }];
}

- (void)sendImageFormUrl:(NSString *)urlStr filePath:(UIImage *)image parameters:(id)parameters process:(ProgressBlock)progress finished:(FinishedBlock)finished
{
    NSString *partURL = [@"" stringByAppendingString:@""];
    NSString *URLString = [partURL stringByAppendingString:urlStr];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html"@"charset=utf-8",@"application/json", nil];
    manager.requestSerializer.timeoutInterval = 20.0;
    
    [AFNetworkActivityIndicatorManager sharedManager].enabled = YES;
    [manager POST:URLString parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        NSData *data = UIImageJPEGRepresentation(image, 0.2);
        [formData appendPartWithFileData:data name:@"" fileName:@"" mimeType:@"image/png"];
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        progress(uploadProgress);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        finished(Enum_SUCCESS,responseObject);
        [AFNetworkActivityIndicatorManager sharedManager].enabled = NO;
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        finished(Enum_FAIL,error);
        [AFNetworkActivityIndicatorManager sharedManager].enabled = NO;
    }];
    
}


@end
