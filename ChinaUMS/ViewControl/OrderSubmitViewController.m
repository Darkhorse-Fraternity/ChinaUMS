//
//  OrderSubmitViewController.m
//  ChinaUMS
//
//  Created by  FLY_TonyYO on 15/4/3.
//  Copyright (c) 2015年  FLY_TonyYO. All rights reserved.
//

#import "OrderSubmitViewController.h"
#import "OrderSubmitViewModel.h"
#import "HudManage.h"
#import "UIImageView+MJWebCache.h"
#import "DialogUtil.h"
@interface OrderSubmitViewController ()<ActionDelegate>
@property (weak, nonatomic) IBOutlet UITextField *cardIDTextField;
@property (weak, nonatomic) IBOutlet UITextField *bankIDTextfiled;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextFiled;
@property (weak, nonatomic) IBOutlet UITextField *phoneNun;
@property (weak, nonatomic) IBOutlet UITextField *limitTextfiled;
@property(nonatomic,strong)OrderSubmitViewModel *sceneModel;
@property (weak, nonatomic) IBOutlet UIImageView *bankImageView;
@property (weak, nonatomic) IBOutlet UITextField *nameTextFiled;
@property (nonatomic,strong)UIBarButtonItem *subItem;
@end

@implementation OrderSubmitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"提交订单";
    [self buildUI];
    [self buildViewModelbinding];
    [self.bankImageView  setTYTImageURLInBaseURL:_entity.IMG_PATH];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

    // Dispose of any resources that can be recreated.
}


-(void)buildUI
{
    self.subItem = [UIBarButtonItem new];
    self.subItem.title = @"提交";
    self.navigationItem.rightBarButtonItem = self.subItem;
}
-(void)buildViewModelbinding
{
    
    self.sceneModel = [OrderSubmitViewModel SceneModel];
    self.sceneModel.request.PROD_ID = self.entity.PROD_ID;
    self.sceneModel.action.aDelegaete = self;
    RACChannelTerminal *modelCARD_NOTerminal = RACChannelTo(self.sceneModel.request, CARD_NO);
    RACChannelTerminal *textCARD_NOTerminal = [self.cardIDTextField rac_newTextChannel];
    [textCARD_NOTerminal subscribe:modelCARD_NOTerminal];
    
    RACChannelTerminal *modelBANK_CARD_NOTerminal = RACChannelTo(self.sceneModel.request, BANK_CARD_NO);
    RACChannelTerminal *textFieldBANK_CARD_NOTerminal = [self.bankIDTextfiled rac_newTextChannel];
    [textFieldBANK_CARD_NOTerminal subscribe:modelBANK_CARD_NOTerminal];
    
    RACChannelTerminal *modelPwdTerminal = RACChannelTo(self.sceneModel.request, BANK_PWD);
    RACChannelTerminal *textFieldPwdTerminal = [self.passwordTextFiled rac_newTextChannel];
    [textFieldPwdTerminal subscribe:modelPwdTerminal];
    
    RACChannelTerminal *modelPHON_NOTerminal = RACChannelTo(self.sceneModel.request, PHON_NO);
    RACChannelTerminal *textFieldPHON_NOTerminal = [self.phoneNun rac_newTextChannel];
    [textFieldPHON_NOTerminal subscribe:modelPHON_NOTerminal];
    
    RACChannelTerminal *modelLIMT_AMTTerminal = RACChannelTo(self.sceneModel.request, LIMT_AMT);
    RACChannelTerminal *textFieldLIMT_AMTTerminal = [self.limitTextfiled rac_newTextChannel];
    [textFieldLIMT_AMTTerminal subscribe:modelLIMT_AMTTerminal];
    
    
    RACChannelTerminal *modelCUST_NMTTerminal = RACChannelTo(self.sceneModel.request, CUST_NM);
    RACChannelTerminal *textFieldnameTerminal = [self.nameTextFiled rac_newTextChannel];
    [textFieldnameTerminal subscribe:modelCUST_NMTTerminal];
    
    [HudManage hudWithNormalDownloadRequest:self.sceneModel.request andInView:self.view];
    self.subItem.rac_command = self.sceneModel.submitCommand;
}

-(void)handleActionMsg:(Request *)msg
{
    if (msg.state ==SuccessState) {
        [DialogUtil showDlgAlert:[msg.output objectForKey:@"Desc"]];
         [[NSNotificationCenter defaultCenter]postNotificationName:@"Order_Refelsh" object:nil];
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
