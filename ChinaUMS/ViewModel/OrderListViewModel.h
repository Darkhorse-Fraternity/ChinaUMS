//
//  OrderListViewModel.h
//  ChinaUMS
//
//  Created by  FLY_TonyYO on 15/4/12.
//  Copyright (c) 2015年  FLY_TonyYO. All rights reserved.
//

#import "SceneModel.h"

#import "OrderListRequest.h"
@interface OrderListViewModel : SceneModel
@property(nonatomic,strong)OrderListRequest *request;


@property(nonatomic)NSInteger requestType;
@property(nonatomic)NSInteger requestSercherType;
@end
