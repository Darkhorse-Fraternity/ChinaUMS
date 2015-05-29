//
//  OrderListEntity.h
//  ChinaUMS
//
//  Created by  FLY_TonyYO on 15/4/12.
//  Copyright (c) 2015年  FLY_TonyYO. All rights reserved.
//

#import "Pagination.h"
@interface OrderListEntity : Pagination
//"ORDR_SEQ": 69,
//"PROD_NM": "工商银行",
//"CUST_NM": "asd",
//"PHON_NO": "11111111111",
//"BANK_PWD": "456456",
//"CARD_NO": "4645654654645",
//"BANK_CARD_NO": "4564 5645 6546 4566",
//"LIMT_AMT": 18000,
//"TO_DT": "",
//"PARM_VAL": "",
//"REGI_DT": "2015-04-12T11:10:20.65",
//"REGI_ID": 1000,
//"REGI_NM": "admin",
//"ORDR_ST": 2,
//"LAST_MOD_ID": 1000,
//"MOD_NM": "admin",
//"LAST_MOD_DT": "2015-04-12T11:10:39.037",
//"MSG_TXT": "您的额度调整操作成功",
//"CURY_CD": "CNY",
//"REAL_LIMT_AMT": 32000,
//"REAL_LIMT_TP": 0
@property(nonatomic,strong)NSNumber *ORDR_SEQ;
@property(nonatomic,strong)NSString *PROD_NM;
@property(nonatomic,strong)NSString *CUST_NM;
@property(nonatomic,strong)NSString *PHON_NO;
@property(nonatomic,strong)NSString *BANK_PWD;
@property(nonatomic,strong)NSString *CARD_NO;
@property(nonatomic,strong)NSString *BANK_CARD_NO;
@property(nonatomic,strong)NSNumber *LIMT_AMT;
@property(nonatomic,strong)NSString *TO_DT;
@property(nonatomic,strong)NSString *PARM_VAL;
@property(nonatomic,strong)NSString *REGI_DT;
@property(nonatomic,strong)NSNumber *REGI_ID;
@property(nonatomic,strong)NSString *REGI_NM;
@property(nonatomic,strong)NSNumber *ORDR_ST;
@property(nonatomic,strong)NSNumber *LAST_MOD_ID;
@property(nonatomic,strong)NSString *MOD_NM;
@property(nonatomic,strong)NSString *LAST_MOD_DT;
@property(nonatomic,strong)NSString *MSG_TXT;
@property(nonatomic,strong)NSString *CURY_CD;
@property(nonatomic,strong)NSNumber *REAL_LIMT_AMT;
@property(nonatomic,strong)NSNumber *REAL_LIMT_TP;


@end
