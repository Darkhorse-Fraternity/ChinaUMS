//
//  HudManage.m
//  ProQ
//
//  Created by pengchunlian on 15/1/13.
//  Copyright (c) 2015年 com.flygps. All rights reserved.
//

#import "HudManage.h"
#import "Action.h"
@interface HudManage()
@property(nonatomic,strong)MBProgressHUD *hud;


@end
@implementation HudManage
DEF_SINGLETON(HudManage)



-(void)loadHudInKeyWindow{
    if (!self.hud) {
        self.hud = [[MBProgressHUD alloc]initWithWindow:[UIApplication sharedApplication].keyWindow];
        [[UIApplication sharedApplication].keyWindow addSubview:self.hud];
    }
}

-(void)loadHud:(UIView *)view{
    if (!self.hud) {
        self.hud = [[MBProgressHUD alloc]initWithView:view];
    }
        [view addSubview:self.hud];
}

-(MBProgressHUD *)showHudProgress:(NSString *)text{
    if (self.hud.superview) {
        [self.hud.superview bringSubviewToFront:self.hud];
    }
    self.hud.mode = MBProgressHUDModeDeterminateHorizontalBar;
    self.hud.labelText = text;
    [self.hud show:YES];
    return self.hud;
}

-(void)showHudIndeterminate:(NSString *)text{
    if (self.hud.superview) {
        [self.hud.superview bringSubviewToFront:self.hud];
    }
    self.hud.mode = MBProgressHUDModeIndeterminate;
    self.hud.labelText = text;
    [self.hud show:YES];
}

-(void)hideHudSuccess:(NSString *)text{
    self.hud.mode = MBProgressHUDModeCustomView;
    self.hud.customView = [IconFont labelWithIcon:[IconFont icon:@"fa_check" fromFont:fontAwesome] fontName:fontAwesome size:37.0f color:[UIColor whiteColor]];
    self.hud.labelText = text;
    [self.hud hide:YES afterDelay:1.0f];
}

-(void)hideHud{
    [self.hud hide:YES];
}

-(void)hideHudFailed:(NSString *)text{
    self.hud.mode = MBProgressHUDModeCustomView;
    self.hud.customView = [IconFont labelWithIcon:[IconFont icon:@"fa_times" fromFont:fontAwesome] fontName:fontAwesome size:37.0f color:[UIColor whiteColor]];
    self.hud.labelText = text;
    [self.hud hide:YES afterDelay:1.0f];
}

#pragma mark 这边做各种样式的window下的Hud

+(void)hudWithNormalDownloadRequest:(Request *)request andInView:(UIView *)view
{
    [[self sharedInstance]  hudWithDownloadRequest:request WithString:@"加载中。。"  andInView:view];
}

-(void)hudWithDownloadRequest:(Request *)request WithString:(NSString *)string andInView:(UIView *)view
{
 
    if (view) {
        [self loadHud:view];
    }else {
        [self loadHudInKeyWindow];
    }
    @weakify(self);
   
    [RACObserve(request, state)subscribeNext:^(NSNumber *state) {
        @strongify(self);
        if(request.state == FailState || request.state == ErrorState){
            NSString *message = [request.output objectForKey:[Action sharedInstance].MSG_KEY];
           
            if (message.isNotEmpty ) {
                [self hideHudFailed:message];
            }else{
                [self hideHud];
            }      
        }else if(request.state == SendingState){
            
            [self.hud show:YES];
            [self showHudIndeterminate:string];
            
            
        }else if(request.state == SuccessState ){
            [self hideHud];
            
        }
    }];
    
    
    
    
}

+(void)hudWithUploadRequest:(Request *)request
{
    
    HudManage *hud = [HudManage sharedInstance];
    [hud loadHudInKeyWindow];
    __weak id target_ = hud;
    
    [[hud rac_valuesForKeyPath:@keypath(request,state) observer:target_ ]subscribeNext:^(id state) {
        
        if(request.state == FailState ){
            
            [hud hideHudFailed:[request.output objectForKey:@"Message"]];
            
        }else if(request.state == SendingState){
            
            
            [hud showHudIndeterminate:@"上传中。。"];
            
            
        }else if(request.state == SuccessState ){
            [hud hideHudSuccess:@"上传成功。。"];
        }
    }];
}



@end
