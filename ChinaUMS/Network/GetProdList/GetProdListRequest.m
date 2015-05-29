//
//  GetProdListRequest.m
//  ChinaUMS
//
//  Created by  FLY_TonyYO on 15/4/13.
//  Copyright (c) 2015年  FLY_TonyYO. All rights reserved.
//

#import "GetProdListRequest.h"

@implementation GetProdListRequest

-(void)loadRequest
{
    [super loadRequest];
    self.PATH = @"Product/GetProdList";
}

@end
