//
//  CompetionFriendsroundViewController.m
//  hanFenData
//
//  Created by zhangbaochuan on 16/5/23.
//  Copyright © 2016年 zbc. All rights reserved.
//

#import "CompetionFriendsroundViewController.h"
#import "AmountPlatCell.h"

@interface CompetionFriendsroundViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation CompetionFriendsroundViewController

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
    AmountPlatCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AmountPlatCell"];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"AmountPlatCell" owner:self options:nil] lastObject];
    }
    cell.labelNum.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    cell.labelcontext.text = [NSString stringWithFormat:@"离校%ld",indexPath.row];
    
    cell.btnAdd.layer.cornerRadius = 3.f;
    if (indexPath.row == 0) {
        [cell.btnAdd setBackgroundColor:[UIColor clearColor]];
        [cell.btnAdd setTitle:@"3000" forState:UIControlStateNormal];
        [cell.btnAdd setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    
    if (indexPath.row == 3) {
        [cell.btnAdd setBackgroundColor:RGBColor(221, 160, 66)];
        [cell.btnAdd setTitle:@"邀请" forState:UIControlStateNormal];
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
