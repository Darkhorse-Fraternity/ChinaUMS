//
//  LoginManage.h
//  ProQ
//
//  Created by pengchunlian on 15/1/8.
//  Copyright (c) 2015年 com.flygps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LoginEntity.h"
@interface LoginManage : NSObject

@property(nonatomic)BOOL isLogin;
@property(nonatomic)LoginEntity *loginEntity;
//建设单例
+ (instancetype )sharedInstance;
#pragma mark 登陆
//登陆
+ (void)loginWithAccount:(NSString *)account  andPassword:(NSString *)password  andOrRemindAccountInfo:(BOOL)yesOrNo andBackValue:(void(^)())backValue;

//退出登陆
+(void)loginOut;
//是否是第一次登陆
+(BOOL)yesOrNoFirstLaunching;

#pragma mark 修改
//修改密码

//修改姓名

//判断是否已经登陆

#pragma mark 账号信息保存

+(void)isSaveAccountInfo:(BOOL)isSave andAccount:(NSString *)account andPassword:(NSString *)password;
+(void)getAccountInfomationWithBlcok:(void(^)(BOOL isSave, NSString *account, NSString *password))backValue;

+(void)modifyAccountInfoWithName:(NSString *)name andMobile:(NSString *)mobile;

#pragma mark  其他
//设置默认值,需放在delegate登陆的第一个方法里。
+(void)setUserDefaultsValue;
//清空信息。
+(BOOL)deleteAccountInfomation;

@end
