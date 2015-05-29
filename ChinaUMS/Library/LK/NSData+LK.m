//
//  NSData+LK.m
//  SeeYouV2
//
//  Created by upin on 13-7-4.
//  Copyright (c) 2013年 灵感方舟. All rights reserved.
//

#import "NSData+LK.h"
#import "NSObject+LK.h"
@implementation NSData (LK)
-(NSString *)convertTo16ByteString
{
    const char *bytes = [self bytes];
    NSInteger length = self.length;
    NSMutableString *hexStr= [NSMutableString string];
    for(int i=0;i<length;i++)
    {
        [hexStr appendFormat:@"%02X",bytes[i]&0xff];
    }
    return hexStr;
}
+(NSArray *)arrayWithJSONData:(NSData *)data
{
    id JSON = [data objectFromJSONDataOrString];
    if([JSON isKindOfClass:[NSArray class]])
    {
        return JSON;
    }
    return nil;
}
+(NSDictionary *)dictionaryWithJSONData:(NSData *)data
{
    id JSON = [data objectFromJSONDataOrString];
    if([JSON isKindOfClass:[NSDictionary class]])
    {
        return JSON;
    }
    return nil;
}
@end
