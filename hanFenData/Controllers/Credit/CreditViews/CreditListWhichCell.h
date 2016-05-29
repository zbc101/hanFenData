//
//  CreditListWhichCell.h
//  hanFenData
//
//  Created by zhangbaochuan on 16/5/20.
//  Copyright © 2016年 zbc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CreditListWhichCell : UITableViewCell

// 行数  列数    内容
-(void)SetviewWithHang:(NSInteger)hang List:(NSInteger)list TitleArray:(NSArray *)titleArr;

@end
