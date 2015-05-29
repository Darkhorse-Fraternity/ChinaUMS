//
//  UIImageView+MJWebCache.h
//  FingerNews
//
//  Created by mj on 13-10-2.
//  Copyright (c) 2013年 itcast. All rights reserved.
//

#import "UIImageView+WebCache.h"

@interface UIImageView (MJWebCache)
- (void)setTYTImageURL:(NSURL *)url placeholder:(UIImage *)placeholder;
- (void)setTYTImageURLStr:(NSString *)urlStr placeholder:(UIImage *)placeholder;
- (void)setTYTImageURLInBaseURL:(NSString *)urlStr;
- (void)setTYTImageURL:(NSString *)urlStr;

@end