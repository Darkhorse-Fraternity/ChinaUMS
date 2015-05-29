//
//  ProQBaseTableViewController.h
//  ProQ
//
//  Created by TYToO on 15/1/7.
//  Copyright (c) 2015年 com.flygps. All rights reserved.
//

#import "BaseViewController.h"


@interface BaseTableViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *dataArray;

@property(nonatomic,strong)NSString *emptyDataPrompt;

//处理上下拉刷新数据
-(NSMutableArray *)success:(NSMutableArray *)originArray
                  newArray:(NSArray *)newArray andPage:(NSNumber *)page;


@end
