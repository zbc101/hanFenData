//
//  AboutMainViewController.m
//  fxdProduct
//
//  Created by zy on 15/12/11.
//  Copyright © 2015年 dd. All rights reserved.
//

#import "AboutMainViewController.h"
#import "MyAboutOursViewController.h"
#import "HelpViewController.h"
#import <objc/runtime.h>

@interface AboutMainViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSArray *contentAry;
}
@end

@implementation AboutMainViewController
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.tabBarController.tabBar.hidden = NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"关于憨分";
    [self addBackItem];
    contentAry=[[NSArray alloc]initWithObjects:@"给个好评",@"常见问题",@"公司简介",@"联系我们",@"检查更新", nil];
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"aboutUs"];
    if(!cell)
    {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1  reuseIdentifier:@"aboutUs"];
    }
    cell.textLabel.text=contentAry[indexPath.row];
    cell.textLabel.textColor=RGBColorAlpha(89, 87, 87, 1);
    cell.textLabel.font=[UIFont systemFontOfSize:16];
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    if (indexPath.row == 4) {
        cell.detailTextLabel.text = @"当前版本1.0";
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50.0;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if(indexPath.row==0)
    {
        UIAlertController *alertView = [UIAlertController alertControllerWithTitle:nil message:@"欢迎给出评价!" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            dispatch_after(0.2, dispatch_get_main_queue(), ^{
                [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"https://itunes.apple.com/cn/app/id1089086853"]];
            });
        }];
        UIAlertAction *cancleAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        [alertView addAction:okAction];
        [alertView addAction:cancleAction];
        [self presentViewController:alertView animated:YES completion:nil];
    }
    else if (indexPath.row==1)
    {
        
        HelpViewController *Myabout=[[HelpViewController alloc]init];
        [self.navigationController pushViewController:Myabout animated:YES];

    }else if(indexPath.row==2)
    {
        
        MyAboutOursViewController *Myabout=[[MyAboutOursViewController alloc]init];
        [self.navigationController pushViewController:Myabout animated:YES];
    }else if(indexPath.row == 3)
    {
        UIAlertController *actionSheett = [UIAlertController alertControllerWithTitle:@"热线服务时间:9:00-17:30(工作日)" message:@"提示内容" preferredStyle:UIAlertControllerStyleActionSheet];
        UIAlertAction *teleAction = [UIAlertAction actionWithTitle:@"4008-678-655" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            NSURL *telURL = [NSURL URLWithString:[NSString stringWithFormat:@"tel://%@", @"4008-678-655"]];
            [[UIApplication sharedApplication] openURL:telURL];
        }];
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        [actionSheett addAction:teleAction];
        [actionSheett addAction:cancelAction];
        [self presentViewController:actionSheett animated:YES completion:nil];
    }else if (indexPath.row == 4){
       
    }
}

//获得所有变量
- (NSArray *)getAllIvar:(id)object
{
    NSMutableArray *array = [NSMutableArray array];
    
    unsigned int count;
    Ivar *ivars = class_copyIvarList([object class], &count);
    for (int i = 0; i < count; i++) {
        Ivar ivar = ivars[i];
        const char *keyChar = ivar_getName(ivar);
        NSString *keyStr = [NSString stringWithCString:keyChar encoding:NSUTF8StringEncoding];
        @try {
            id valueStr = [object valueForKey:keyStr];
            NSDictionary *dic = nil;
            if (valueStr) {
                dic = @{keyStr : valueStr};
            } else {
                dic = @{keyStr : @"值为nil"};
            }
            [array addObject:dic];
        }
        @catch (NSException *exception) {}
    }
    return [array copy];
}
//获得所有属性
- (NSArray *)getAllProperty:(id)object
{
    NSMutableArray *array = [NSMutableArray array];
    
    unsigned int count;
    objc_property_t *propertys = class_copyPropertyList([object class], &count);
    for (int i = 0; i < count; i++) {
        objc_property_t property = propertys[i];
        const char *nameChar = property_getName(property);
        NSString *nameStr = [NSString stringWithCString:nameChar encoding:NSUTF8StringEncoding];
        [array addObject:nameStr];
    }
    return [array copy];
}


@end
