//
//  LoginRequest.m
//  ProQ
//
//  Created by pengchunlian on 15/1/13.
//  Copyright (c) 2015年 com.flygps. All rights reserved.
//

#import "LoginRequest.h"
#import "OpenUDID.h"
@implementation LoginRequest


-(void)loadRequest{
    [super loadRequest];
    
    self.PATH = @"login/ServerLogin";
    self.METHOD = @"POST";
    self.Sgin = [OpenUDID value];
}
@end
