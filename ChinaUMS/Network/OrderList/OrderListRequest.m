//
//  OrderListRequest.m
//  ChinaUMS
//
//  Created by  FLY_TonyYO on 15/4/12.
//  Copyright (c) 2015年  FLY_TonyYO. All rights reserved.
//

#import "OrderListRequest.h"

@implementation OrderListRequest
-(void)loadRequest{
    [super loadRequest];
    self.PATH = @"Order/GetOrder";
    self.count = @10000;
    self.page = @1;
    self.type = @"";
}
@end
