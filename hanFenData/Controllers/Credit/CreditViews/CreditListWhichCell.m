//
//  CreditListWhichCell.m
//  hanFenData
//
//  Created by zhangbaochuan on 16/5/20.
//  Copyright © 2016年 zbc. All rights reserved.
//

#import "CreditListWhichCell.h"

@implementation CreditListWhichCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self)
    {
        //        [self createCellUI];
    }
    self.backgroundColor = [UIColor clearColor];
    return self;
}

-(void)SetviewWithHang:(NSInteger)hang List:(NSInteger)list TitleArray:(NSArray *)titleArr
{
    CGFloat width = (_k_w - 32) / list;
    for (int i = 0; i < hang; i++) {
        for (int j = 0; j < list; j++) {
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(16 + j * width, i * 25, width, 25)];
            label.text = titleArr[j + list * i];
            label.layer.borderWidth = 0.5;
            label.layer.borderColor = [UIColor clearColor].CGColor;
            label.backgroundColor = [UIColor whiteColor];
            label.textAlignment = NSTextAlignmentCenter;
            [self addSubview:label];
        }
    }
}

@end
