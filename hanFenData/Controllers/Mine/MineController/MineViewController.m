//
//  MineViewController.m
//  hanFenDate
//
//  Created by zhangbaochuan on 16/5/10.
//  Copyright © 2016年 zbc. All rights reserved.
//

#import "MineViewController.h"
#import "LoginViewController.h"
#import "MineTitelCell.h"
#import "MinelistCell.h"
#import "MineIcontitleViewController.h"
#import <ShareSDK/ShareSDK.h>
#import <ShareSDKUI/ShareSDK+SSUI.h>

@interface MineViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSArray *titleArr;
}
@property (nonatomic, strong) NSArray *imageArr;
@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
//    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
    self.fd_prefersNavigationBarHidden = YES;
    self.automaticallyAdjustsScrollViewInsets = NO;
    titleArr = @[@"我的借款",@"借款申请信息",@"我的银行卡",@"我的好友",@"邀请好友",@"关于憨分",@"意见反馈"];
    _imageArr = @[@"04_my_01_icon02",@"04_my_01_icon08",@"04_my_01_icon03"
                  ,@"04_my_01_icon04",@"04_my_01_icon05",@"04_my_01_icon06"
                  ,@"04_my_01_icon07"];
    UITableView *tableVC = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, _k_w, _k_h - 49) style:UITableViewStyleGrouped];
    tableVC.delegate = self;
    tableVC.dataSource = self;
    if (_k_w < 375) {
        tableVC.scrollEnabled = YES;
    }else{
        tableVC.scrollEnabled = NO;
    }
//    tableVC.scrollEnabled = NO;
    tableVC.backgroundColor = RGBColor(239, 239, 239);
    tableVC.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tableVC];
    self.view.backgroundColor = [UIColor blackColor];
    
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    self.fd_prefersNavigationBarHidden = YES;
    
}

#pragma mark ->UITableViewDelegate,UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }
    if(section == 1){
        return 3;
    }
    return 2;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            MineTitelCell *cell = [tableView dequeueReusableCellWithIdentifier:@"celid"];
            if (!cell) {
                cell = [[[NSBundle mainBundle] loadNibNamed:@"MineTitelCell" owner:self options:nil] lastObject];
            }
           
            cell.nameLabel.text = @"上官泓刚接";
            cell.IDLabel.text = @"Hd1425336";
//            cell.selectionStyle  = UITableViewCellSelectionStyleNone;
            cell.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"04_my_01_bj"]];
            [cell.btnIconImage setImage:[UIImage imageNamed:@"20160514_icon"] forState:UIControlStateNormal];
            [cell.btnIconImage addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
            return cell;

        }
    }else{
        static NSString *cell1 = @"cell1";
        MinelistCell *cell = [tableView dequeueReusableCellWithIdentifier:cell1];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"MinelistCell" owner:self options:nil] lastObject];
        }
        if (indexPath.section == 1) {
            cell.imageviewicon.image = [UIImage imageNamed:_imageArr[indexPath.row]];
            
            cell.labelTitle.text =titleArr[indexPath.row];
        }
        if (indexPath.section == 2) {
            cell.imageviewicon.image = [UIImage imageNamed:_imageArr[indexPath.row + 3]];
            
            cell.labelTitle.text =titleArr[indexPath.row + 3];
        }
        if (indexPath.section == 3) {
            cell.imageviewicon.image = [UIImage imageNamed:_imageArr[indexPath.row + 5]];
            
            cell.labelTitle.text =titleArr[indexPath.row + 5];
        }
        cell.lableDetailTitle.hidden = YES;

        return cell;

    }
    return nil;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 0.00000001;
    }
    if (section == 1) {
        return 8.f;
    }
    return 15.f;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.001;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 200.f;
    }
    return 48.f;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSArray *viewControllArray = @[@"MyLoanMoneyViewController",
                                   @"loanApplyViewController",
                                   @"MyBandcardsViewController",
                                   @"MyFriendsViewController",
                                   @"",
                                   @"AboutMainViewController",
                                   @"IdeaBackViewController",
                                   @""];
    NSInteger tagVC = 0;
    if (indexPath.section == 0) {
        tagVC = 7;
    }
    if (indexPath.section == 1) {
        tagVC = indexPath.row;
    }
    if (indexPath.section == 2) {
        tagVC = indexPath.row + 3;
        if (indexPath.row == 1) {
            //分享
            [self shareSdkcontect];
        }
    }
    if (indexPath.section == 3) {
        tagVC = indexPath.row + 5;
        
    }
    Class classViews=NSClassFromString(viewControllArray[tagVC]);
    UIViewController *uvc=[[classViews alloc] init];
    [self.navigationController pushViewController:uvc animated:YES];
    
}

-(void)btnClick:(UIButton *)btn{
    MineIcontitleViewController *mineVC = [MineIcontitleViewController new];
    self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:mineVC animated:YES];
    self.hidesBottomBarWhenPushed = NO;
}

-(void)shareSdkcontect{
    
    
     NSArray* imageArray = @[[UIImage imageNamed:@"04_my_02_icon08.png"]];
    NSMutableDictionary *shareParams = [NSMutableDictionary dictionary];
    [shareParams SSDKSetupShareParamsByText:@"分享内容-张保川http://weixin.qq.com/r/0UynvwvEJFZbrU-c9xnD"
                                     images:imageArray
                                        url:[NSURL URLWithString:@"http://weixin.qq.com/r/0UynvwvEJFZbrU-c9xnD"]
                                      title:@"其他"
                                       type:SSDKContentTypeAuto];
    
    //2、分享（可以弹出我们的分享菜单和编辑界面）
//    http://weixin.qq.com/r/D5d3b4-EIdJercsM98Id
    [shareParams SSDKSetupWeChatParamsByText:@"微信"
                                       title:@"微信好友"
                                         url:[NSURL URLWithString:@"http://weixin.qq.com/qr/0UynvwvEJFZbrU-c9xnD"]
                                  thumbImage:imageArray[0]
                                       image:imageArray[0]
                                musicFileURL:nil
                                     extInfo:@""
                                    fileData:nil
                                emoticonData:nil
                                        type:SSDKContentTypeAuto
                          forPlatformSubType:SSDKPlatformSubTypeWechatSession];
    [shareParams SSDKSetupWeChatParamsByText:@"微信朋友圈"
                                       title:@"微信朋友圈--"
                                         url:[NSURL URLWithString:@"http://weixin.qq.com/r/0UynvwvEJFZbrU-c9xnD"]
                                  thumbImage:imageArray[0]
                                       image:imageArray[0]
                                musicFileURL:nil
                                     extInfo:@""
                                    fileData:nil
                                emoticonData:nil
                                        type:SSDKContentTypeAuto
                          forPlatformSubType:SSDKPlatformSubTypeWechatTimeline];
    
    [ShareSDK showShareActionSheet:nil //要显示菜单的视图, iPad版中此参数作为弹出菜单的参照视图，只有传这个才可以弹出我们的分享菜单，可以传分享的按钮对象或者自己创建小的view 对象，iPhone可以传nil不会影响
                             items:@[@(SSDKPlatformSubTypeWechatSession),
                                     @(SSDKPlatformSubTypeWechatTimeline),
                                     @(SSDKPlatformSubTypeQQFriend),
                                     @(SSDKPlatformSubTypeQZone),
                                     @(SSDKPlatformTypeSinaWeibo),
                                     @(SSDKPlatformTypeSMS),
                                     @(SSDKPlatformTypeCopy)]
                       shareParams:shareParams
               onShareStateChanged:^(SSDKResponseState state, SSDKPlatformType platformType, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error, BOOL end) {
                  
               }];
                   

}

@end
