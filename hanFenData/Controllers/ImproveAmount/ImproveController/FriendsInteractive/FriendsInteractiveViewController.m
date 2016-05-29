//
//  FriendsInteractiveViewController.m
//  hanFenData
//
//  Created by zhangbaochuan on 16/5/18.
//  Copyright © 2016年 zbc. All rights reserved.
//

#import "FriendsInteractiveViewController.h"
#import "MinelistCell.h"
#import "MyFriendsViewController.h"

@interface FriendsInteractiveViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) NSArray *titleArr;
@property (nonatomic, strong) NSArray *sectionOneArr;


@end

@implementation FriendsInteractiveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"好友互动";
    self.automaticallyAdjustsScrollViewInsets = NO;
    _titleArr = @[@"好友互动信息"];
    _sectionOneArr = @[@"好友互动",@"邀请好友"];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 2;
    }
    return 2;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cell1 = @"cell1";
    MinelistCell *cell = [tableView dequeueReusableCellWithIdentifier:cell1];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"MinelistCell" owner:self options:nil] lastObject];
    }
    cell.imageviewicon.image = [UIImage imageNamed:[NSString stringWithFormat:@"03_tie_02_icon%ld",indexPath.section * 2 + indexPath.row +11]];
    
    cell.labelTitle.text =_sectionOneArr[indexPath.section * 2 + indexPath.row];
    if (indexPath.row == 1) {
        cell.lableDetailTitle.text = @"共34位好友";
//        cell.lableDetailTitle.textColor = [UIColor greenColor];
    }
    
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 48.f;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 48.f;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] init];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(16, 0, 200, 48)];
    label.text = _titleArr[section];
    label.font = [UIFont systemFontOfSize:15];
    label.textColor = RGBColor(151, 151, 151);
    [view addSubview:label];
    return view;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 0) {
        MyFriendsViewController *myFriendsVC = [MyFriendsViewController new];
        [self.navigationController pushViewController:myFriendsVC animated:YES];
    }
}
@end
