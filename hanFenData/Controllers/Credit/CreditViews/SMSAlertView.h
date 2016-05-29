//
//  SMSAlertView.h
//  hanFenData
//
//  Created by zhangbaochuan on 16/5/24.
//  Copyright © 2016年 zbc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SMSAlertView : UIView
@property (weak, nonatomic) IBOutlet UIView *alertView;
@property (weak, nonatomic) IBOutlet UITextField *textfiledCodes;
@property (weak, nonatomic) IBOutlet UIButton *btncountDown;
@property (weak, nonatomic) IBOutlet UIButton *btnSure;
@property (weak, nonatomic) IBOutlet UIView *bgview;


-(void)show;
- (void)hide;

@end
