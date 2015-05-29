//
//  ProQBaseTableViewController.m
//  ProQ
//
//  Created by TYToO on 15/1/7.
//  Copyright (c) 2015年 com.flygps. All rights reserved.
//

#import "BaseTableViewController.h"



@interface BaseTableViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic)BOOL isOpenemptyDataPrompt;
@property(nonatomic,strong)NSNumber *tatal;
@end

@implementation BaseTableViewController

-(instancetype)init
{
    self = [super init];
    if (self) {
        self.dataArray = [NSMutableArray array];
    }
    return self;

}
- (void)viewDidLoad {
    [super viewDidLoad];

    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];

    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor clearColor];
    //    self.tableView.separatorStyle =  UITableViewCellSeparatorStyleNone;
    [self.tableView setTableFooterView:[UIView new]];
    
    [self.view addSubview:self.tableView];
    // Do any additional setup after loading the view.
//   [self.tableView alignToView:self.view]; 
    @weakify(self);
    [[RACObserve(self, dataArray)map:^id(NSArray *value) {
        return @(value.count);
    }]subscribeNext:^(NSNumber *x) {
        @strongify(self);
        self.isOpenemptyDataPrompt = !x.boolValue;
    }];
}
    
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

    
#pragma mark 未获取数据时候的表现。
-(void)setIsOpenemptyDataPrompt:(BOOL)isOpenemptyDataPrompt
{
    _isOpenemptyDataPrompt = isOpenemptyDataPrompt;
    UILabel *label = (id)[self.view viewWithTag:9871234];
    if(isOpenemptyDataPrompt  && !label){
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 100)];
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = [UIColor lightGrayColor];
        label.center = CGPointMake(SCREEN_WIDTH/2.f, 100);
        label.tag = 9871234;
        label.text = self.emptyDataPrompt?:@"未检查到数据。";
        [self.view insertSubview:label atIndex:0];
    }else if (label && !isOpenemptyDataPrompt){
        [label removeFromSuperview];
    }
}


//处理上下拉刷新数据
-(NSMutableArray *)success:(NSMutableArray *)originArray
                  newArray:(NSArray *)newArray andPage:(NSNumber *)page{
    if (page.integerValue == 1) {
        [originArray removeAllObjects];
        originArray = [NSMutableArray array];
    }
    if([newArray count]>0){
        [originArray addObjectsFromArray:newArray];
    }
    return originArray;
}


#pragma tableViewDelegate。
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *Identify = @"CellIdentify";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Identify];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identify];
    }
    
    return cell;
    
    
}
    
    
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return section?15.f:0.1f;
}

    
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}
    
#pragma mark other
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    if ([self isViewLoaded])
    {
        [self deleteTableViewDelegate:self.view];
    }
    NSLog(@"dealloc vc = %@",self);
}

- (void)deleteTableViewDelegate:(UIView *)view
{
    NSArray *array = view.subviews;
    for (UIView *view in array)
    {
        if ([view isKindOfClass:[UIScrollView class]])
        {
            UITableView *tableView = (id) view;
            //            [tableView setDragDelegate:nil refreshDatePermanentKey:nil];
            tableView.delegate = nil;
            
            if ([tableView respondsToSelector:@selector(setDataSource:)])
            {
                [tableView setDataSource:nil];
            }
        }
        else if ([view respondsToSelector:@selector(setDelegate:)])
        {
            [((id) view) setDelegate:nil];
        }
        
        if (view.subviews.count)
        {
            [self deleteTableViewDelegate:view];
        }
    }
}



@end
