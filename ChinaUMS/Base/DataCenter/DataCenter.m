//
//  DataCenter.m
//  ProQ
//
//  Created by tonyYo on 15/1/24.
//  Copyright (c) 2015年 com.flygps. All rights reserved.
//

#import "DataCenter.h"


@interface DataCenter()

@end

@implementation DataCenter

+ (instancetype)sharedInstance
{
    static DataCenter *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];

    });
    return sharedInstance;
}




@end
