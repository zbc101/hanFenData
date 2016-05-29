//
//  LoginViewController.h
//  hanFenDate
//
//  Created by zhangbaochuan on 16/5/10.
//  Copyright © 2016年 zbc. All rights reserved.
//

#import "BaseIndexViewController.h"



@interface LoginViewController : BaseIndexViewController

+ (instancetype)newLoginVCWithLoginenterBlock:(void(^)())loginEnterBlock;

@property (nonatomic, strong) NSString *flagStirng;



@end
