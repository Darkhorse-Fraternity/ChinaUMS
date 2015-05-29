//
//  OrderListTableViewCell.m
//  ChinaUMS
//
//  Created by  FLY_TonyYO on 15/4/12.
//  Copyright (c) 2015年  FLY_TonyYO. All rights reserved.
//

#import "OrderListTableViewCell.h"


@interface OrderListTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *orderIDLable;
@property (weak, nonatomic) IBOutlet UILabel *bankLabel;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *IDCardLabel;
@property (weak, nonatomic) IBOutlet UILabel *cardIDLabel;
@property (weak, nonatomic) IBOutlet UILabel *passwordLabel;
@property (weak, nonatomic) IBOutlet UILabel *limitLabel;
@property (weak, nonatomic) IBOutlet UILabel *secondLimitLabel;

@property (weak, nonatomic) IBOutlet UILabel *treatmentStateLabel;
@property (weak, nonatomic) IBOutlet UILabel *submitDateLabel;
//0 表示未处理
//1表示处理中
//-1 表示失败
//2表示成功
@end

@implementation OrderListTableViewCell

- (void)awakeFromNib {
    // Initialization code
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setEntity:(OrderListEntity *)entity
{
    _entity = entity;
    self.orderIDLable.text = [NSString stringWithFormat:@"订单号:%@",entity.ORDR_SEQ];
    self.bankLabel.text = [NSString stringWithFormat:@"银行:%@",entity.PROD_NM];
    self.nameLabel.text = [NSString stringWithFormat:@"户名:%@",entity.CUST_NM];
    self.IDCardLabel.text = [NSString stringWithFormat:@"身份证:%@",entity.CARD_NO];
    self.cardIDLabel.text = [NSString stringWithFormat:@"卡号:%@",entity.BANK_CARD_NO];
    self.passwordLabel.text = [NSString stringWithFormat:@"密码:%@",entity.BANK_PWD];
    self.limitLabel.text = [NSString stringWithFormat:@"额度:%@",entity.LIMT_AMT];
    self.secondLimitLabel.text = [NSString stringWithFormat:@"新额度: %@",entity.REAL_LIMT_AMT];
    self.submitDateLabel.text = [NSString stringWithFormat:@"提交日期:%@",entity.REGI_DT];
 
    NSString *ORDR_ST;
    switch (entity.ORDR_ST.integerValue) {
        case 2:
            ORDR_ST = @"成功";
            break;
        case -1:
            ORDR_ST = @"失败";
 
            break;
        case 0:
            ORDR_ST = @"未处理";
 
            break;
        case 1:
            ORDR_ST = @"处理中";
 
            break;
            
        default:
            ORDR_ST = @"失败";
            break;
    }
    
    self.treatmentStateLabel.text = [NSString stringWithFormat:@"处理状态:%@",ORDR_ST];
    
    
}


@end
