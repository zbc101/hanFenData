//
//  AddInfoPerferctindentViewController.m
//  hanFenData
//
//  Created by zhangbaochuan on 16/5/18.
//  Copyright © 2016年 zbc. All rights reserved.
//

#import "AddInfoPerferctindentViewController.h"
#import "PerfectIdentityInfoCell.h"
#import "CreditBtnCell.h"

@interface AddInfoPerferctindentViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSArray *placeArr;


@end

@implementation AddInfoPerferctindentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"编辑联系人";
    self.automaticallyAdjustsScrollViewInsets = NO;
    _placeArr = @[@"联系人1",@"联系人2",@"需要添加两位联系人方可通过认证",
                  @"关系",@"姓名",@"联系方式",
                  @"关系",@"姓名",@"联系方式"];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 2) {
        return 1;
    }
    return 3;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 2) {
        static NSString *cell1 = @"CreditBtnCell";
        CreditBtnCell *cell = [tableView dequeueReusableCellWithIdentifier:cell1];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"CreditBtnCell" owner:self options:nil] lastObject];
        }
        [cell.btnCreditSubmit setTitle:@"保存" forState:UIControlStateNormal];
        [cell.btnCreditSubmit addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        return cell;
        
    }else{
        static NSString *cell1 = @"cell1";
        PerfectIdentityInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:cell1];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"PerfectIdentityInfoCell" owner:self options:nil] lastObject];
        }
        cell.textfiledTitile.placeholder = _placeArr[indexPath.row + 3 + 3 * indexPath.section];
        if (indexPath.row == 1 || indexPath.row == 2) {
            cell.imageIndexDetail.hidden = YES;
        }
        return cell;
    }
    return nil;
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return _placeArr[section];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 2) {
        return 80.f;
    }
    return 56.f;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 44.f;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.001f;
}
-(void)btnClick:(UIButton *)btn{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
