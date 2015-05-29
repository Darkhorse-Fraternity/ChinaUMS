//
//  OrderListRequest.h
//  ChinaUMS
//
//  Created by  FLY_TonyYO on 15/4/12.
//  Copyright (c) 2015年  FLY_TonyYO. All rights reserved.
//

#import "Request.h"

@interface OrderListRequest : Request
@property(nonatomic,strong)NSNumber *page;
@property(nonatomic,strong)NSNumber *count;
@property(nonatomic,strong)NSString *type;
@property(nonatomic,strong)NSString *SelVal;
@end
