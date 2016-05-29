//
//  Utility.h
//  fxdProduct
//
//  Created by dd on 15/9/25.
//  Copyright © 2015年 dd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Utility : NSObject

@property (nonatomic,strong) NSString *userInfo;
@property (nonatomic,strong) NSString *getMineyInfo;
@property (nonatomic,assign) BOOL loginFlage;
@property (nonatomic,assign) BOOL networkState;
@property (nonatomic,retain) NSMutableDictionary *getMoneyParam;


+ (Utility *)sharedUtility;

@end
