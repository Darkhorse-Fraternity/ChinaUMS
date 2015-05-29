//
//  OrderSubmitViewModel.m
//  ChinaUMS
//
//  Created by  FLY_TonyYO on 15/4/12.
//  Copyright (c) 2015年  FLY_TonyYO. All rights reserved.
//

#import "OrderSubmitViewModel.h"

@implementation OrderSubmitViewModel

-(void)loadSceneModel
{
    [super loadSceneModel];
    
    self.request = [OrderSubmitRequest Request];
  
//    @property(nonatomic,strong)NSNumber *CARD_NO;
//    @property(nonatomic,strong)NSNumber *BANK_CARD_NO;
//    @property(nonatomic,strong)NSNumber *BANK_PWD;
//    @property(nonatomic,strong)NSNumber *PHON_NO;
//    @property(nonatomic,strong)NSNumber *LIMT_AMT;
    
    RACSignal *verfiySignal = [RACSignal combineLatest:@[RACObserve(self.request, CARD_NO), RACObserve(self.request, BANK_CARD_NO),RACObserve(self.request, BANK_PWD),RACObserve(self.request, PHON_NO),RACObserve(self.request, LIMT_AMT) ,RACObserve(self.request,CUST_NM)] reduce:^(NSString *username, NSString *pwd,NSString *vcode,NSString *text4,NSString *text5 ,NSString * text6){
        return @(username.length > 0 && pwd.length > 0 && vcode.length && text4.length && text5.length &&text6.length);
    }];
    @weakify(self);
    _submitCommand = [[RACCommand alloc] initWithEnabled:verfiySignal signalBlock:^RACSignal *(id input) {
        @strongify(self);
        [self SEND_ACTION:self.request];
         return [[RACSignal empty]throttle:1.f];
    }];
    
}

@end
