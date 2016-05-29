//
//  MyFriendsViewController.m
//  hanFenData
//
//  Created by zhangbaochuan on 16/5/19.
//  Copyright © 2016年 zbc. All rights reserved.
//

#import "MyFriendsViewController.h"
#import "MyFriendsInfoViewController.h"
#import "NewMyFriendsViewController.h"

@interface MyFriendsViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *dataLIst;
@property (nonatomic, strong) NSArray *DetailArr;

@end

@implementation MyFriendsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"我的好友";
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self creatData];
}


-(void)creatData
{
    self.dataLIst=[NSMutableArray array];
    for (int i=0; i<3; i++) {
        NSMutableArray *arra=[NSMutableArray array];
        for (int j=0; j<5; j++) {
            NSString *name=[NSString stringWithFormat:@"小明:%d",j+1];
            [arra addObject:name];
        }
        [_dataLIst addObject:arra];
    }
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }
    return [[_dataLIst objectAtIndex:section - 1] count];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _dataLIst.count + 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellString = @"cll";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellString];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellString];
    }
   
    if(indexPath.section == 0){
        cell.imageView.image = [UIImage imageNamed:@"04_my_02_icon07"];
         cell.textLabel.text = @"新的好友";
        cell.detailTextLabel.text = @"3";
        cell.detailTextLabel.backgroundColor = RGBColor(227, 165, 67);
        cell.detailTextLabel.layer.cornerRadius = 20.f;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }else{
        cell.imageView.image = [UIImage imageNamed:@"20160514_icon"];
         cell.textLabel.text = [_dataLIst[indexPath.section - 1] objectAtIndex:indexPath.row];
    }
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 48.f;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 10.f;
    }
    return 48.f;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return [NSString stringWithFormat:@"%c",(char)(section + 'A')];
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01f;
}

- (nullable NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    NSArray *array = @[@"+",@"A",@"B",@"C",@"D"];
    return array;
}                                                   // return list of section titles to display in section index view (e.g. "ABCD...Z#")
- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index{
    return index;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 0) {
        NewMyFriendsViewController *newMyfriends = [NewMyFriendsViewController new];
        [self.navigationController pushViewController:newMyfriends animated:YES];
    }else{
        MyFriendsInfoViewController *myFreingVc = [MyFriendsInfoViewController new];
        [self.navigationController pushViewController:myFreingVc animated:YES];
    }
    
}

@end
