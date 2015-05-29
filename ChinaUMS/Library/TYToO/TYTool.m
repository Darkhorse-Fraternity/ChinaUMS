//
//  TYTool.m
//  ProQ
//
//  Created by pengchunlian on 15/1/16.
//  Copyright (c) 2015年 com.flygps. All rights reserved.
//

#import "TYTool.h"

@implementation TYTool

//  十进制转二进制
+ (NSInteger)toBinarySystemWithDecimalSystem:(NSInteger)decimal
{
    NSInteger num = decimal;
    NSInteger remainder = 0;      //余数
    NSInteger divisor = 0;        //除数
    
    NSString * prepare = @"";
    
    while (true)
    {
        remainder = num%2;
        divisor = num/2;
        num = divisor;
        prepare = [prepare stringByAppendingFormat:@"%ld",(long)remainder];
        
        if (divisor == 0)
        {
            break;
        }
    }
    
    NSString * result = @"";
    for (NSInteger i = prepare.length - 1; i >= 0; i --)
    {
        result = [result stringByAppendingFormat:@"%@",
                  [prepare substringWithRange:NSMakeRange(i , 1)]];
    }
    
    return [result integerValue];
}

//  二进制转十进制
+ (int)toDecimalSystemWithBinarySystem:(int )binaryInt
{
    NSString *binary = [NSString stringWithFormat:@"%d",binaryInt];
    int ll = 0 ;
    int  temp = 0 ;
    for (int i = 0; i < binary.length; i ++)
    {
        temp = [[binary substringWithRange:NSMakeRange(i, 1)] intValue];
        temp = temp * powf(2, binary.length - i - 1);
        ll += temp;
    }
    
    NSString * result = [NSString stringWithFormat:@"%d",ll];
    
    return [result intValue];
}


// 十进制 转化为number数组对象。
+(NSArray *)permissionsJudge:(NSInteger)permission
{
    
    NSInteger i = [TYTool toBinarySystemWithDecimalSystem:permission];//将十进制转为二进制。
    NSString *n = [NSString stringWithFormat:@"%ld",(long)i];
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:n.length];
    NSInteger j= 0;
    while (j<=n.length) {
        if ((j&permission) == j) {
            [array addObject:[NSNumber numberWithInteger:j]];
        }
        j++;
    }
    return array;
}

@end
