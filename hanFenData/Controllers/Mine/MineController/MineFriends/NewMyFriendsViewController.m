//
//  NewMyFriendsViewController.m
//  hanFenData
//
//  Created by zhangbaochuan on 16/5/19.
//  Copyright © 2016年 zbc. All rights reserved.
//

#import "NewMyFriendsViewController.h"
#import "MyFriendsAskCell.h"

@interface NewMyFriendsViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation NewMyFriendsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"新的好友";
    self.automaticallyAdjustsScrollViewInsets = NO;
    
}




-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cell1 = @"MyFriendsAskCell";
    MyFriendsAskCell *cell = [tableView dequeueReusableCellWithIdentifier:cell1];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"MyFriendsAskCell" owner:self options:nil] lastObject];
    }
    
    if (indexPath.row == 0) {
        [cell.btnButtom setTitle:@"接受" forState:UIControlStateNormal];
        cell.btnButtom.backgroundColor = RGBColor(227, 165, 67);
        cell.btnButtom.layer.cornerRadius = 3;
    }
    if (indexPath.row == 1) {
        [cell.btnButtom setTitle:@"邀请" forState:UIControlStateNormal];
        cell.btnButtom.backgroundColor = RGBColor(227, 165, 67);
        cell.btnButtom.layer.cornerRadius = 3;

    }
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 48.f;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    
    return 10.f;
}


-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01f;
}




@end
