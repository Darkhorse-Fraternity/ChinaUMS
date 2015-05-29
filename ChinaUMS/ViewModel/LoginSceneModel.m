//
//  LoginSceneModel.m
//  ChinaUMS
//
//  Created by  FLY_TonyYO on 15/4/3.
//  Copyright (c) 2015年  FLY_TonyYO. All rights reserved.
//

#import "LoginSceneModel.h"
#import "LoginManage.h"
#import "UIImageView+MJWebCache.h"
#import "LoginEntity.h"
#import "OpenUDID.h"
static NSString *const LastUserNameKey = @"LastUserName";
@interface LoginSceneModel()<ActionDelegate>
@end
@implementation LoginSceneModel


-(void)loadSceneModel
{
    
    [super loadSceneModel];
    self.request = [LoginRequest Request];
    self.action.aDelegaete = self;

    RACSignal *verfiySignal = [RACSignal combineLatest:@[RACObserve(self.request, UserName), RACObserve(self.request, Pwd),RACObserve(self.request, Vcode)] reduce:^(NSString *username, NSString *pwd,NSString *vcode){
        return @(username.length > 0 && pwd.length > 0 && vcode.length);
    }];
//    [verfiySignal subscribeNext:^(id x) {
//        
//    }];
    @weakify(self);
    _loginCommand = [[RACCommand alloc] initWithEnabled:verfiySignal signalBlock:^RACSignal *(id input) {
        @strongify(self);
        [self login];
        
        return [RACSignal empty];
    }];

    self.cCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {

        
        UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
        pasteboard.string = [OpenUDID value];
        
        return [RACSignal empty];
    }];
    
}


- (void)bindData
{
    self.request.UserName = [[NSUserDefaults standardUserDefaults] objectForKey:LastUserNameKey];
}

- (void)login
{
    [[NSUserDefaults standardUserDefaults] setValue:self.request.UserName forKey:LastUserNameKey];
    [self SEND_IQ_ACTION:self.request];
    
}

-(void)addVocodImageLogic:(UIImageView *)imageView
{
    [[SDImageCache sharedImageCache] removeImageForKey:ChinaUMS_Captcha];
    [imageView setTYTImageURL:ChinaUMS_Captcha];
    imageView.userInteractionEnabled = YES;
    @weakify(imageView);
    [imageView whenTapped:^{
        @strongify(imageView);
        [[SDImageCache sharedImageCache] removeImageForKey:ChinaUMS_Captcha];
        [imageView setTYTImageURL:ChinaUMS_Captcha];
    }];
}

-(void)handleActionMsg:(Request *)msg
{

    if (msg.state == SuccessState ) {
        LoginEntity * entity = [[LoginEntity alloc]initWithDictionary:[msg.output objectForKey:@"Data"]  error:nil];
        [LoginManage sharedInstance].isLogin = YES;
        [LoginManage sharedInstance].loginEntity = entity;
    }

}


@end
