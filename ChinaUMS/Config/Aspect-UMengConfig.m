//
//  Aspect-appearance.m
//  mcapp
//
//  Created by zhuchao on 14/12/16.
//  Copyright (c) 2014年 zhuchao. All rights reserved.
//

#import "AppDelegate.h"
#import <XAspect/XAspect.h>
#import "MobClick.h"

#define CHANNEL_ID @""
#define UMAppKey @"54d079fffd98c5a4b00005d9"
#define AtAspect  UMengConfig

#define AtAspectOfClass AppDelegate
@classPatchField(AppDelegate)
AspectPatch(-, BOOL, application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions)
{
    
    [MobClick startWithAppkey:UMAppKey reportPolicy:SEND_INTERVAL   channelId:CHANNEL_ID];

    [MobClick checkUpdate:NSLocalizedString(@"我们有新版本咯~！", nil) cancelButtonTitle:NSLocalizedString(@"下次吧~", nil) otherButtonTitles:NSLocalizedString(@"走起~", nil)];
    [MobClick updateOnlineConfig];
    return XAMessageForward(application:application didFinishLaunchingWithOptions:launchOptions);
}

@end
#undef AtAspectOfClass
#undef AtAspect