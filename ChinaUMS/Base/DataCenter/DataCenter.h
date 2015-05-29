//
//  DataCenter.h
//  ProQ
//
//  Created by tonyYo on 15/1/24.
//  Copyright (c) 2015年 com.flygps. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataCenter : NSObject
+ (instancetype)sharedInstance;
@property(nonatomic,strong)NSString *baseURL;

//时间与Wifi
@property(nonatomic,retain)NSString *time;
@property(nonatomic,assign)BOOL isWifi;


@end
