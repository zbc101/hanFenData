//
//  HelpViewController.m
//  fxdProduct
//
//  Created by dd on 15/10/27.
//  Copyright © 2015年 dd. All rights reserved.
//

#import "HelpViewController.h"
#import "HelpViewCell.h"

@interface HelpViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSArray *dataArr;
    NSArray *detailArr;
    NSMutableArray *isOpen;
}
@end

@implementation HelpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.title=@"常见问题";
    [self addBackItem];

    self.helpTableView.showsVerticalScrollIndicator = NO;

    isOpen=[[NSMutableArray alloc]init];
    dataArr=@[@"借款需要具备哪些基本条件？",@"借款的额度范围和期限？",@"借款费用有哪些? ",@"如何还款？",@"借款步骤有哪些？",@"什么情况会导致借款失败？",@"借款申请提交之后，审批时间多久？放款时间多久？",@"申请借款后，是否可以再次申请借款？",@"如果审核未通过，还能再次申请借款吗？",@"发薪贷支持哪些银行的借记卡？",@"如果有逾期发生，需要支付哪些费用？",@"如何保护借款人提交的信息？"];
    detailArr=@[@"1、本人手机号及手机服务密码；\n2、本人有效身份证；\n3、有流水记录的银行卡和信用卡。",
                @"额度：500元~3000元。\n借款周期：1周~50周。",
                @"服务费：按借款金额的0.3%每天收取。",
                @"1、自动扣款：发薪贷在客户最后还款日从指定银行卡中扣除当期欠款。\n2、主动还款：客户可以点击我要还款，系统将从指定银行卡中扣除客户当期欠款。如果客户有逾期，也可以连同逾期欠款一起还款。\n3、结清：客户可以点击结清借款，结清当期欠款和剩余本金。\n4、逾期欠款：系统会发短信提醒客户当前逾期金额，请客户保障扣款银行卡中有足够金额，系统会自动扣除逾期欠款。\n5、强制结清：客户逾期超过30天，我们将强制结清客户全部欠款和剩余本金，请客户保障扣款银行卡中有足够余额，系统会自动扣除",
                @"    注册——登录——提交借款申请——审核——提款——放款",
                @"1、姓名、身份证、手机服务密码不正确；\n2、信用卡与身份信息不匹配；\n3、手机号使用时间不超过六个月；\n4、借款已结清客户，当天再次申请无法通过，第二天才可以再次申请。",
                @"审批时间：每天16:30前借款，当天审批放款；16:30之后借款第二天审批放款；周六、周日提交借款申请的将于下周一审批放款。\n放款时间：客户提款后立即放款。",
                @"不可以，借款全部还清后可以再次申请借款。但结清当天不可申请借款。",
                @"如果借款申请审核未通过，那么90天后才可再次进行申请。",
                @"1、中国银行\n2、中国工商银行\n3、中国农业银行\n4、中国建设银行\n5、中国光大银行\n6、中国民生银行\n7、兴业银行\n8、中信银行(需开通银联无卡业务)\n9、浦发银行(需开通银联无卡业务)\n10、平安银行(需开通银联无卡业务)",
                @"        如果您未能按时偿付当期还款，除需支付原有的应付未付款项之外， 还需支付逾期违约金及逾期罚息。违约金：10元/笔，逾期手续费：逾期不超过15天（包括15天）按当期剩余本金的0.5%每日收取。逾期超过15天，则按当期剩余本金的0.75%每日收取。并向中国人民征信中心提交不良记录。",
                @"        发薪贷遵守国家法律法规，对用户的隐私信息进行严格保护。发薪贷承诺绝不出售、出租或以任何其他形式泄漏发薪贷用户的信息，同时发薪贷会采取多种加密措施，防止任何人盗取用户信息。"];
    for(int i=0;i<dataArr.count;i++)
    {
        [isOpen addObject:[NSNumber numberWithBool:NO]];
    }
    self.helpTableView.delegate=self;
    self.helpTableView.dataSource=self;
    self.helpTableView.estimatedRowHeight=44.0;
    self.helpTableView.rowHeight=UITableViewAutomaticDimension;
    [self.helpTableView registerNib:[UINib nibWithNibName:@"HelpViewCell" bundle:nil] forCellReuseIdentifier:@"help"];
}


#pragma mark - UITableViewDelegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(![isOpen[section] boolValue])
    {
        return 0;
    }
    else
    {
        return 1;
    }
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return dataArr.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HelpViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"help"];
    cell.lblContent.text=detailArr[indexPath.section];
    return  cell;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//    HelpDetaliViewController *helpDetaiVC=[HelpDetaliViewController new];
//    helpDetaiVC.indexRow=indexPath.row;
//    
//    [self.navigationController pushViewController:helpDetaiVC animated:YES];
}
//创建按钮
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    UIView *Subview=[[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 50)];
    Subview.backgroundColor=[UIColor whiteColor];
    UILabel *lbl=[[UILabel alloc]initWithFrame:CGRectMake(18, 0, Subview.frame.size.width-40, 50)];
    lbl.numberOfLines=0;
    lbl.text=dataArr[section];
    lbl.textColor=RGBColorAlpha(89, 87, 87, 1);
    
    lbl.numberOfLines=0;
    lbl.userInteractionEnabled=YES;
    
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(on_click:)];
    [Subview addGestureRecognizer:tap];
    UIView *lineView=[[UIView alloc]initWithFrame:CGRectMake(0, 49.5, [UIScreen mainScreen].bounds.size.width, 0.5)];
    lineView.backgroundColor=RGBColorAlpha(180, 180, 181, 1);
    ;
    UIImageView *imgView=[[UIImageView alloc]initWithFrame:CGRectMake(_k_w-14-18,17, 14, 14)];
    BOOL b=[isOpen[section] boolValue];
    if(b)
    {
        imgView.image=[UIImage imageNamed:@"more-arrow-2"];
    }
    else
    {
        imgView.image=[UIImage imageNamed:@"more-arrow-3"];
    }
    Subview.tag=section+1;
    imgView.tag=section+1000;
    [Subview addSubview:lineView];
    [Subview addSubview:lbl];
    [Subview addSubview:imgView];
    return Subview;
}
-(void)on_click:(UITapGestureRecognizer *)tap
{
    //获取点击的那一段的展开状态
    BOOL b=[isOpen[[tap view].tag-1] boolValue];
    UIImageView *imgView=(UIImageView*)[self.view viewWithTag:[tap view].tag-1+1000];
    if(b)
    {
        imgView.image=[UIImage imageNamed:@"more-arrow-3"];
    }
    else
    {
        imgView.image=[UIImage imageNamed:@"more-arrow-2"];
    }
    //修改展开状态
    [isOpen replaceObjectAtIndex:[tap view].tag-1 withObject:[NSNumber numberWithBool:!b]];
    
    //刷新表格视图的某个分区
    //第一个参数是类似于 数组的一个集合
    [self.helpTableView reloadSections:[NSIndexSet indexSetWithIndex:[tap view].tag-1] withRowAnimation:UITableViewRowAnimationAutomatic];
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 50;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//隐藏tabbar
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
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
