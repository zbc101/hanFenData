//
//  RegisterViewController.h
//  hanFenDate
//
//  Created by zhangbaochuan on 16/5/10.
//  Copyright © 2016年 zbc. All rights reserved.
//

#import "BaseIndexViewController.h"


@interface RegisterViewController : BaseIndexViewController

+ (instancetype)newRegisiterVCWithRegistring:(NSString *)RegisterString LoginenterBlock:(void(^)())registerEnterBlock;
@property (weak, nonatomic) IBOutlet UIButton *btnNextRegister;
@property (weak, nonatomic) IBOutlet UIButton *btnLonginRegister;



@end
