//
//  OrderLIstViewController.m
//  ChinaUMS
//
//  Created by  FLY_TonyYO on 15/4/3.
//  Copyright (c) 2015年  FLY_TonyYO. All rights reserved.
//

#import "OrderLIstViewController.h"
#import "OrderListViewModel.h"
#import "LoginManage.h"
#import "SVPullToRefresh.h"
#import "IQDropDownTextField.h"
#import "OrderListTableViewCell.h"
#import "OrderListHeaderView.h"
#import "HudManage.h"
#import "BankTableViewController.h"
#import "GetDelOrdr.h"
#import "LoginManage.h"
#import "DialogUtil.h"
#import "OrderHeaderView.h"
@interface OrderLIstViewController ()<ActionDelegate>
@property (strong, nonatomic) UIBarButtonItem *leftItem;
@property (strong, nonatomic) UIBarButtonItem *subItem;
@property (strong, nonatomic) OrderListViewModel *viewModel;
@property (strong, nonatomic) GetDelOrdr *delRequest;

//@property (strong, nonatomic) UIButton *sel


@end

@implementation OrderLIstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    @weakify(self);
    [self buildUI];
    [self buildViewModelbinding];
    
    // Do any additional setup after loading the view.
    
}

-(void)buildUI{
    self.title = @"订单列表";
    self.leftItem = [UIBarButtonItem new];
    self.leftItem.title = @"退出登录";
    self.navigationItem.leftBarButtonItem = self.leftItem;
    
    self.subItem = [UIBarButtonItem new];
    self.subItem.title = @"提交订单";
    self.navigationItem.rightBarButtonItem = self.subItem;
    
    //做一个查询切换的tableView Header
    

    self.tableView.tableHeaderView = ({
        
        OrderListHeaderView *headerView =  [OrderListHeaderView setUpOrderListHeaderView];
        headerView.IQ_height = 100.f;
        headerView;
//        OrderHeaderView *headerView = [[NSBundle mainBundle] loadNibNamed:@"OrderHeaderView" owner:self options:nil].firstObject;
//        headerView.IQ_height = 200.f;
//        headerView;
        
        //        headerView systemLayoutSizeFittingSize:<#(CGSize)#>
    });
    

    

//    [self.view addSubview:headerView];
}



-(void)buildViewModelbinding
{
    
    @weakify(self);
    self.leftItem.rac_command = [[RACCommand alloc]initWithSignalBlock:^RACSignal *(id input) {
        @strongify(self);
        [self.navigationController popToRootViewControllerAnimated:YES];
        [self dismissViewControllerAnimated:YES completion:^{
            //退出登录
            [LoginManage sharedInstance].isLogin = NO;
        }];
        
        return [RACSignal empty];
        
    }];
    
    self.subItem.rac_command = [[RACCommand alloc]initWithSignalBlock:^RACSignal *(id input) {
        @strongify(self);
        [self.navigationController pushViewController:[BankTableViewController new] animated:YES];
        
        return [RACSignal empty];
        
    }];
    
    self.viewModel = [OrderListViewModel SceneModel];
    self.viewModel.action.aDelegaete = self;

    [HudManage hudWithNormalDownloadRequest:self.viewModel.request andInView:self.view];
   

    OrderListHeaderView *headerView = (id)self.tableView.tableHeaderView;

    [RACObserve(headerView.OrderTypeTextField, text) subscribeNext:^(NSString *x) {
        @strongify(self);
        if (x.length>0) {
            headerView.searchTextFiled.text = @"";
            self.viewModel.requestType = headerView.OrderTypeTextField.selectedRow;

        }
    }];
    
    
    [[headerView.searchTextFiled.rac_textSignal throttle:1.f]subscribeNext:^(NSString *x) {
        @strongify(self);
        if (x.length >0) {
            headerView.OrderTypeTextField.text = @"";
            self.viewModel.requestSercherType = headerView.SearchConditionTextField.selectedRow;
            self.viewModel.request.SelVal = x;
            [self.viewModel SEND_IQ_ACTION:self.viewModel.request];
        }else{
            headerView.OrderTypeTextField.selectedRow = 0;
        }
    }];
   
    
    
    
    [self.tableView addPullToRefreshWithActionHandler:^{
        @strongify(self);
         [self.viewModel SEND_IQ_ACTION:self.viewModel.request];
    }];
//    [self.tableView addInfiniteScrollingWithActionHandler:^{
//        @strongify(self);
//        self.viewModel.request.page = [self.viewModel.request.page increase:@1];
//    }];
}

-(void)handleActionMsg:(Request *)msg
{
    if (msg.state == SuccessState && msg == self.viewModel.request) {
        NSArray *newArray = [OrderListEntity arrayOfModelsFromDictionaries:[msg.output objectForKey:@"Data"]];

        self.dataArray = [self  success:self.dataArray newArray:newArray andPage:self.viewModel.request.page];
        [self.tableView reloadData];
        
    }
   [self.tableView endAllRefreshingWithEnd:NO]; 
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"OrderListTableViewCell";
    BOOL nibsRegistered = NO;
    if (!nibsRegistered) {
        UINib *nib = [UINib nibWithNibName:NSStringFromClass([OrderListTableViewCell class]) bundle:nil];
        [tableView registerNib:nib forCellReuseIdentifier:CellIdentifier];
        nibsRegistered = YES;
    }
    OrderListTableViewCell *cell = (id)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    cell.entity = self.dataArray[indexPath.section];
    return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 263.f;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    

    if (editingStyle ==UITableViewCellEditingStyleDelete) {//如果编辑样式为删除样式
        OrderListEntity *entity = self.dataArray[indexPath.section];
 
        if (entity.REGI_ID.integerValue != [LoginManage sharedInstance].loginEntity.User_Id.integerValue) {
            
            [DialogUtil showDlgAlert:@"只能删除自己提交的订单"];
        }
        
        
        GetDelOrdr *delRequest = [GetDelOrdr Request];
        delRequest.ordr_seq = entity.ORDR_SEQ;
        [self.viewModel SEND_ACTION:delRequest];
        
        [self.dataArray removeObjectAtIndex:indexPath.section];
        NSIndexSet *sectionIndex = [NSIndexSet indexSetWithIndex:indexPath.section];
        [tableView deleteSections:sectionIndex withRowAnimation:UITableViewRowAnimationLeft];
 
    }
    
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
