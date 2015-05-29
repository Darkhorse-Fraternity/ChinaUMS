//
//  LoginManage.m
//  ProQ
//
//  Created by pengchunlian on 15/1/8.
//  Copyright (c) 2015年 com.flygps. All rights reserved.
//

#import "LoginManage.h"
#import "LoginEntity.h"
#import "SSKeychain.h"
@interface LoginManage()
@property(nonatomic,strong)LoginEntity *user; //用作修改用。
@end

@implementation LoginManage

//建立单例
+ (instancetype )sharedInstance{
    static dispatch_once_t onceToken;
    static LoginManage *_singleton = nil;
    dispatch_once(&onceToken,^{
        _singleton = [[super allocWithZone:NULL] init];
        _singleton.user = [LoginEntity new];
    });
    return _singleton;
}

+ (id)allocWithZone:(struct _NSZone *)zone{
    return [self sharedInstance];
}




#pragma mark 登陆与退出登录
+ (void)loginWithAccount:(NSString *)account  andPassword:(NSString *)password  andOrRemindAccountInfo:(BOOL)yesOrNo andBackValue:(void(^)())backValue
{


}


+(void)loginOut
{
    UIViewController *deleate= [UIApplication  sharedApplication].keyWindow.rootViewController;
    
    if([deleate isKindOfClass:[UINavigationController class]])
    {
        [deleate dismissViewControllerAnimated:YES completion:nil];
    }else{
      
    }
    
    //清空密码。
    [LoginManage deleteAccountInfomation];
    
    [[NSNotificationCenter defaultCenter]postNotificationName:@"ProjectLoginOut" object:nil];
}


#pragma mark 其他
//是否是第一次登陆 
static NSString *const isFirstLaunching = @"LoginLogic_isFirstLaunching";
+(BOOL)yesOrNoFirstLaunching
{

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    /*设置引导页*/
    BOOL yesOrNoFirstLaunching =[defaults boolForKey:isFirstLaunching];
    if (yesOrNoFirstLaunching) {
        [defaults setBool:NO forKey:isFirstLaunching];
    }
    return yesOrNoFirstLaunching;
}


#pragma mark 选择是否需要保存数据

//存账号和密码的信息
static NSString *const SaveAccountInfo = @"LoginManage_SaveAccountInfo";
static NSString *const AccountService = @"LoginManage_ProQ";
static NSString *const isNeedSave = @"LoginManage_isNeedSave";
+(void)isSaveAccountInfo:(BOOL)isSave andAccount:(NSString *)account andPassword:(NSString *)password
{
    //是否需要保存密码，打钩保存，NO：不保存
    if (isSave) {
        [self saveAccount:account andPassword:password];
    }else{
        //没打勾清空账号密码
        [self deleteAccountInfomation];
    }
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setBool:isSave forKey:isNeedSave];
    [defaults synchronize];
}

+(void)getAccountInfomationWithBlcok:(void(^)(BOOL isSave, NSString *account, NSString *password))backValue;
{

    NSUserDefaults *defaults          = [NSUserDefaults standardUserDefaults];
    NSData *myEncodedObject           = [defaults objectForKey:SaveAccountInfo];
    if(myEncodedObject.isNotEmpty)
    {
    [LoginManage sharedInstance].user = (LoginEntity *)[NSKeyedUnarchiver unarchiveObjectWithData: myEncodedObject];//将所有信息取出
//    NSString *account                 = [LoginManage sharedInstance].user.account;
//    NSString *password                = [SSKeychain passwordForService:AccountService account:account];
    BOOL isSave                       = [defaults boolForKey:isNeedSave];
        if (backValue) {
//            backValue(isSave,account,password);
        }
    }

}

+(BOOL)saveAccount:(NSString *)account andPassword:(NSString *)password
{
    [self saveAccountInfo];
    return  [SSKeychain setPassword:password forService:AccountService account:account];
}

+(BOOL)deleteAccountInfomation
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *account        = [defaults objectForKey:SaveAccountInfo];
    [defaults removeObjectForKey:SaveAccountInfo];
    return [SSKeychain deletePasswordForService:AccountService account:account];
}


+(void)modifyAccountInfoWithName:(NSString *)name andMobile:(NSString *)mobile;
{

    [self saveAccountInfo];
    
  
    
}

+(void)saveAccountInfo
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *myEncodedObject  = [NSKeyedArchiver archivedDataWithRootObject:[LoginManage sharedInstance].user];//将所有信息存入;
    [defaults setObject:myEncodedObject forKey:SaveAccountInfo];
}

#pragma mark 设置默认值
+(void)setUserDefaultsValue
{
    NSUserDefaults *standardDefaults = [NSUserDefaults standardUserDefaults];
    [standardDefaults registerDefaults:@{isFirstLaunching:@YES ,isNeedSave:@YES}];
    
}




@end