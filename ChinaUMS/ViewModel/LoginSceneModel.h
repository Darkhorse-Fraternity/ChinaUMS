//
//  LoginSceneModel.h
//  ChinaUMS
//
//  Created by  FLY_TonyYO on 15/4/3.
//  Copyright (c) 2015年  FLY_TonyYO. All rights reserved.
//

#import "SceneModel.h"

#import "LoginRequest.h"

@interface LoginSceneModel : SceneModel

@property (nonatomic, strong) RACCommand *loginCommand;
@property (nonatomic,strong )RACCommand *cCommand;

@property(nonatomic,strong)LoginRequest *request;
- (void)bindData;
-(void)addVocodImageLogic:(UIImageView *)imageView;

@end
