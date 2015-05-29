//
//  ViewController.m
//  ChinaUMS
//
//  Created by  FLY_TonyYO on 15/4/2.
//  Copyright (c) 2015年  FLY_TonyYO. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginManage.h"
#import "LoginSceneModel.h"
#import "OpenUDID.h"
#import "HudManage.h"
#import "OrderLIstViewController.h"
#import "BaseNavigationController.h"
//#import "base"
@interface LoginViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *accountTextField;
@property (weak, nonatomic) IBOutlet UIImageView *VcodeImage;

@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UITextField *VerificationCodeTextField;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UITextField *testHostURL;

@property (weak, nonatomic) IBOutlet UIButton *cBtn;
@property (strong,nonatomic)LoginSceneModel *sceneModel;
@end

@implementation LoginViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // 数据获取都在VM里，通过属性暴露给VC，暴露的方法就是单向或双向绑定
    // Do any additional setup after loading the view, typically from a nib.
    [self buildUI];
    [self buildViewModelbinding];
    [self.sceneModel bindData];
}

-(void)buildUI
{
    self.testHostURL.text = [OpenUDID value];
    self.testHostURL.delegate = self;
 
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range       replacementString:(NSString *)string{
    return NO;
}
- (void)buildViewModelbinding
{
    self.sceneModel = [LoginSceneModel SceneModel];
    [HudManage hudWithNormalDownloadRequest:self.sceneModel.request andInView:self.view];
    [self.sceneModel addVocodImageLogic:self.VcodeImage];
    
    RACChannelTerminal *modelTerminal = RACChannelTo(self.sceneModel.request,UserName);
    RACChannelTerminal *textFieldTerminal = [self.accountTextField rac_newTextChannel];
    [modelTerminal subscribe:textFieldTerminal];
    [textFieldTerminal subscribe:modelTerminal];
    
    RACChannelTerminal *modelPwdTerminal = RACChannelTo(self.sceneModel.request, Pwd);
    RACChannelTerminal *textFieldPwdTerminal = [self.passwordTextField rac_newTextChannel];
    [textFieldPwdTerminal subscribe:modelPwdTerminal];
   
    RACChannelTerminal *modelVcodeTerminal = RACChannelTo(self.sceneModel.request, Vcode);
    RACChannelTerminal *textFieldVcodeTerminal = [self.VerificationCodeTextField rac_newTextChannel];
    [textFieldVcodeTerminal subscribe:modelVcodeTerminal];
    
    
    self.loginBtn.rac_command = self.sceneModel.loginCommand;
    
    @weakify(self);
    [[RACObserve(self.sceneModel.request, state)filter:^BOOL(NSNumber *value) {
        return value.integerValue == SuccessState;
    }]subscribeNext:^(id x) {
        @strongify(self);
      
        [self presentViewController:  [[BaseNavigationController alloc]initWithRootViewController:[OrderLIstViewController new]] animated:YES completion:nil];
    }];
    
    self.cBtn.rac_command = self.sceneModel.cCommand;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}


@end
