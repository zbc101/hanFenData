//
//  amountFriendsCell.h
//  hanFenData
//
//  Created by zhangbaochuan on 16/5/23.
//  Copyright © 2016年 zbc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface amountFriendsCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *labelNumber;
@property (weak, nonatomic) IBOutlet UIImageView *imageviewIcon;
@property (weak, nonatomic) IBOutlet UILabel *labelContext;

@property (weak, nonatomic) IBOutlet UILabel *labelAmount;
@property (weak, nonatomic) IBOutlet UIButton *btnAddFriends;

@end
