//
//  BankTabelSceneModel.m
//  ChinaUMS
//
//  Created by  FLY_TonyYO on 15/4/13.
//  Copyright (c) 2015年  FLY_TonyYO. All rights reserved.
//

#import "BankTabelSceneModel.h"

@implementation BankTabelSceneModel

-(void)loadSceneModel
{
    [super loadSceneModel];
    self.request = [GetProdListRequest Request];
}

@end
