//
//  CompetitionPlatFormViewController.m
//  hanFenData
//
//  Created by zhangbaochuan on 16/5/23.
//  Copyright © 2016年 zbc. All rights reserved.
//

#import "CompetitionPlatFormViewController.h"
#import "amountFriendsCell.h"

@interface CompetitionPlatFormViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation CompetitionPlatFormViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.automaticallyAdjustsScrollViewInsets = NO;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 25;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    amountFriendsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"amountFriendsCell"];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"amountFriendsCell" owner:self options:nil] lastObject];
    }
    cell.labelNumber.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    cell.labelContext.text = [NSString stringWithFormat:@"离校%ld",indexPath.row];
    cell.labelAmount.text = @"3000";
    cell.btnAddFriends.layer.cornerRadius = 3.f;
    if (indexPath.row == 0) {
        [cell.btnAddFriends setTitle:@"" forState:UIControlStateNormal];
        cell.btnAddFriends.hidden = YES;
        
    }
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 48.f;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.1f;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1f;
}



@end
