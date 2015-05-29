//
//  OrderSubmitViewModel.h
//  ChinaUMS
//
//  Created by  FLY_TonyYO on 15/4/12.
//  Copyright (c) 2015年  FLY_TonyYO. All rights reserved.
//

#import "SceneModel.h"
#import "OrderSubmitRequest.h"
#import "OrderSubmitEntity.h"
@interface OrderSubmitViewModel : SceneModel

//@property(nonatomic,strong)OrderSubmitEntity *entity;
@property(nonatomic,strong)OrderSubmitRequest *request;
@property (nonatomic, strong) RACCommand *submitCommand;




@end
