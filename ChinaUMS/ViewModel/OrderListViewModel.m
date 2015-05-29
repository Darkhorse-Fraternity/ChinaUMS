//
//  OrderListViewModel.m
//  ChinaUMS
//
//  Created by  FLY_TonyYO on 15/4/12.
//  Copyright (c) 2015年  FLY_TonyYO. All rights reserved.
//

#import "OrderListViewModel.h"

@interface OrderListViewModel()<ActionDelegate>
@property(nonatomic,strong)NSArray *typeArray;
@end
@implementation OrderListViewModel

-(void)loadSceneModel
{
    [super loadSceneModel];
    
    self.request = [OrderListRequest Request];

//    @weakify(self);
//    [RACObserve(self.request, page)subscribeNext:^(id x) {
//        @strongify(self);
//       [self SEND_IQ_ACTION:self.request];
//    }];
   
    self.typeArray = @[@"ALL",@"OK",@"ING",@"FAIL",@"NOT",@"CUST",@"ORDR",@"CARD",@"BAK"];
    @weakify(self);
    [[[NSNotificationCenter defaultCenter]rac_addObserverForName:@"Order_Refelsh" object:nil]subscribeNext:^(id x) {
        @strongify(self);
        [self setRequestType:0];
    }];
}





-(void)setRequestType:(NSInteger)requestType
{
    _requestType = requestType;
    self.request.type = self.typeArray[requestType];
    [self SEND_IQ_ACTION:self.request];
    
}

-(void)setRequestSercherType:(NSInteger)requestSercherType
{
    _requestSercherType = requestSercherType;
    self.request.type = self.typeArray[requestSercherType +5];
}
@end
