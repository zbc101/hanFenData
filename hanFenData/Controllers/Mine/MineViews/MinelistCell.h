//
//  MinelistCell.h
//  hanFenData
//
//  Created by zhangbaochuan on 16/5/16.
//  Copyright © 2016年 zbc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MinelistCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageviewicon;
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;
@property (weak, nonatomic) IBOutlet UILabel *lableDetailTitle;
@property (weak, nonatomic) IBOutlet UIView *viewButton;

@end
