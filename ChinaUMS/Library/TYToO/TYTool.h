//
//  TYTool.h
//  ProQ
//
//  Created by pengchunlian on 15/1/16.
//  Copyright (c) 2015年 com.flygps. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TYTool : NSObject
//  十进制转二进制
+ (NSInteger)toBinarySystemWithDecimalSystem:(NSInteger)decimal;
//  二进制转十进制
+ (int)toDecimalSystemWithBinarySystem:(int )binaryInt;
//  十进制转number数组。
+(NSArray *)permissionsJudge:(NSInteger)permission;
@end
