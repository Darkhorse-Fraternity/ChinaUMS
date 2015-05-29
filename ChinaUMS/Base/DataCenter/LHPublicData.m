//
//  LHPublicData.m
//  LaHuo
//
//  Created by ljh on 14-10-23.
//  Copyright (c) 2014年 LaHuo. All rights reserved.
//

#import "LHPublicData.h"

@implementation LHPublicData
+(NSString *)channelID
{
    static __strong NSString *channelID;
    static dispatch_once_t onceToken;
    if(channelID == nil)
    {
        dispatch_once(&onceToken, ^{
            NSString *path = [[NSBundle mainBundle] pathForResource:@"channel" ofType:@"txt"];
            NSMutableString *text = [NSMutableString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
            [text replaceOccurrencesOfString:@"\r" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, text.length)];
            [text replaceOccurrencesOfString:@"\n" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, text.length)];
            [text replaceOccurrencesOfString:@" " withString:@"_" options:NSCaseInsensitiveSearch range:NSMakeRange(0, text.length)];
            
            channelID = [[NSString alloc] initWithString:text];
        });
        onceToken = 0;
    }
    return channelID ? :@"unknown";
}
@end
