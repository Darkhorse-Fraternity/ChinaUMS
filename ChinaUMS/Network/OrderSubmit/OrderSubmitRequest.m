//
//  OrderSubmitRequest.m
//  ChinaUMS
//
//  Created by  FLY_TonyYO on 15/4/12.
//  Copyright (c) 2015年  FLY_TonyYO. All rights reserved.
//

#import "OrderSubmitRequest.h"
#import "OpenUDID.h"
#import "LoginManage.h"
//PORD_ID 银行id
//CARD_NO 身份证号
//BANK_CARD_NO 银行卡
//BANK_PWD 查询密码
//PHON_NO 手机号
//LIMT_AMT 额度
//TO_DT 为空
//PWD_VAL 为空
//PWD_PARM_VAL 唯一值
//CUST_NM 户名
//CURY_CD 请默认为CNY
@implementation OrderSubmitRequest
-(void)loadRequest{
    [super loadRequest];
    
    self.PATH = @"Order/InsertOrder";
    self.METHOD = @"POST";
    self.TO_DT = @"";
    self.PWD_VAL = @"";
    self.PWD_PARM_VAL = [OpenUDID value];

    self.CURY_CD = @"CNY";
    
}
@end
