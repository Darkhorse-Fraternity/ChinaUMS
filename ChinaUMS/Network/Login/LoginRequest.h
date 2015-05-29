//
//  LoginRequest.h
//  ProQ
//
//  Created by pengchunlian on 15/1/13.
//  Copyright (c) 2015年 com.flygps. All rights reserved.
//

#import "Request.h"

@interface LoginRequest : Request

@property(nonatomic,strong)NSString *UserName;
@property(nonatomic,strong)NSString *Pwd;

@property(nonatomic,strong)NSString *Vcode;//验证码
@property(nonatomic,strong)NSString *Sgin;//唯一码
@end
