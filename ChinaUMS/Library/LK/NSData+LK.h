//
//  NSData+LK.h
//  SeeYouV2
//
//  Created by upin on 13-7-4.
//  Copyright (c) 2013年 灵感方舟. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (LK)

//把 NSData 转成 16进制的字符串
-(NSString *)convertTo16ByteString;

+(NSArray*)arrayWithJSONData:(NSData*)data;
+(NSDictionary*)dictionaryWithJSONData:(NSData*)data;
@end
