//
//  InfoCallback.h
//  ProQ
//
//  Created by pengchunlian on 15/1/22.
//  Copyright (c) 2015年 com.flygps. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void(^InfobaclCallbackBlcok)(id info);
@interface TYTInfoBridge : NSObject


//单例
- (TYTInfoBridge *)sharedInstance;
+ (TYTInfoBridge *)sharedInstance;


// 反向回调的block。
+(void)backblock:(InfobaclCallbackBlcok)block;

+(void)shareBlock:(id)info;
@end
