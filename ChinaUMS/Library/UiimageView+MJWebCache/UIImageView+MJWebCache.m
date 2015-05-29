//
//  UIImageView+MJWebCache.m
//  FingerNews
//
//  Created by mj on 13-10-2.
//  Copyright (c) 2013年 itcast. All rights reserved.
//

#import "UIImageView+MJWebCache.h"

@implementation UIImageView (MJWebCache)
- (void)setTYTImageURL:(NSURL *)url placeholder:(UIImage *)placeholder
{
    [self sd_setImageWithURL:url placeholderImage:placeholder options:SDWebImageRetryFailed | SDWebImageLowPriority];
}

- (void)setTYTImageURLStr:(NSString *)urlStr placeholder:(UIImage *)placeholder
{
    [self setTYTImageURL:[NSURL URLWithString:urlStr] placeholder:placeholder];
}

- (void)setTYTImageURLInBaseURL:(NSString *)urlStr
{
    NSString *urlsting = [NSString stringWithFormat:@"%@%@",ChinaUMS_ImageBaseURL,urlStr];
    [self setTYTImageURL:urlsting];
}



- (void)setTYTImageURL:(NSString *)urlStr
{
    [self setImageWithURL:[NSURL URLWithString:urlStr] placeholderImage:[UIImage imageNamed:@"arrow-down"] usingActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    
}

@end
