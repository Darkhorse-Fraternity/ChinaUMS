

//
//  InfoCallback.m
//  ProQ
//
//  Created by pengchunlian on 15/1/22.
//  Copyright (c) 2015年 com.flygps. All rights reserved.
//

#import "TYTInfoBridge.h"

@interface TYTInfoBridge()
@property(nonatomic,strong)InfobaclCallbackBlcok blcok;
@end

@implementation TYTInfoBridge
//实现单例
- (TYTInfoBridge *)sharedInstance
{
    return [TYTInfoBridge sharedInstance];
}
+ (TYTInfoBridge *)sharedInstance
{
    static dispatch_once_t once;
    static TYTInfoBridge * __singleton__;
    dispatch_once( &once, ^{ __singleton__ = [[[self class] alloc] init]; } ); \
    return __singleton__;
}



#pragma mark 主要方法
+(void)backblock:(InfobaclCallbackBlcok)block
{
    [self sharedInstance].blcok = block;
}

+(void)shareBlock:(id)info
{
    if ([self sharedInstance].blcok) {
           [self sharedInstance].blcok(info);
    }else{
        NSLog(@"大爷的。你赋值了吗");
    }
}



@end
