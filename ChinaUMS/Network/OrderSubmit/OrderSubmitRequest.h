//
//  OrderSubmitRequest.h
//  ChinaUMS
//
//  Created by  FLY_TonyYO on 15/4/12.
//  Copyright (c) 2015年  FLY_TonyYO. All rights reserved.
//

#import "Request.h"
//page=1&count=10&type=OK&SelVal=OK
@interface OrderSubmitRequest : Request

//http://www.chinaums-te.com/api/Order/InsertOrder
//    post-data:PROD_ID={0}&CARD_NO={1}&BANK_CARD_NO={2}&BANK_PWD={3}&PHON_NO={4}&LIMT_AMT={5}&TO_DT={6}&PWD_VAL={7}&PWD_PARM_VAL={8}&CUST_NM={9}&CURY_CD={10}
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

@property(nonatomic,strong)NSNumber *PROD_ID;
@property(nonatomic,strong)NSNumber *CARD_NO;
@property(nonatomic,strong)NSNumber *BANK_CARD_NO;
@property(nonatomic,strong)NSNumber *BANK_PWD;
@property(nonatomic,strong)NSNumber *PHON_NO;
@property(nonatomic,strong)NSNumber *LIMT_AMT;
@property(nonatomic,strong)NSString *TO_DT;
@property(nonatomic,strong)NSString *PWD_VAL;
@property(nonatomic,strong)NSString *PWD_PARM_VAL;
@property(nonatomic,strong)NSString *CUST_NM;
@property(nonatomic,strong)NSString *CURY_CD;



@end
