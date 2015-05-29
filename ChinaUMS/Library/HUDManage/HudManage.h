//
//  HudManage.h
//  ProQ
//
//  Created by pengchunlian on 15/1/13.
//  Copyright (c) 2015年 com.flygps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBProgressHUD.h"

#import "Request.h"
@interface HudManage : NSObject
AS_SINGLETON(HudManage)

-(void)loadHudInKeyWindow;
-(void)loadHud:(UIView *)view;
-(MBProgressHUD *)showHudProgress:(NSString *)text;
-(void)showHudIndeterminate:(NSString *)text;
-(void)hideHud;
-(void)hideHudSuccess:(NSString *)text;
-(void)hideHudFailed:(NSString *)text;

typedef void(^BackValue)(NSString *string,BOOL yesOrNoShow);
+(void)hudWithNormalDownloadRequest:(Request *)request andInView:(UIView *)view;
+(void)hudWithUploadRequest:(Request *)request;
@end
