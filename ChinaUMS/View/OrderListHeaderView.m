//
//  OrderListHeaderView.m
//  ChinaUMS
//
//  Created by  FLY_TonyYO on 15/4/12.
//  Copyright (c) 2015年  FLY_TonyYO. All rights reserved.
//

#import "OrderListHeaderView.h"

@interface OrderListHeaderView()


@end

@implementation OrderListHeaderView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(void)awakeFromNib{
//    self.layer.borderColor = [UIColor grayColor].CGColor;
//    self.layer.borderWidth = 0.1f;
//    @"ALL",@"OK",@"ING",@"FAIL",@"NOT"
    self.OrderTypeTextField.itemList = @[@"全部订单",@"成功订单",@"进行中订单",@"失败订单",@"未处理订单"];
    self.OrderTypeTextField.isOptionalDropDown = NO;
    self.OrderTypeTextField.selectedRow = 0;
//   @"CUST",@"ORDR",@"CARD",@"BAK" 
    self.SearchConditionTextField.itemList = @[@"户名",@"订单号",@"身份证号",@"银行卡号"];
    self.SearchConditionTextField.isOptionalDropDown = NO;
    self.SearchConditionTextField.selectedRow = 0;
}


+(OrderListHeaderView *)setUpOrderListHeaderView
{
    
    OrderListHeaderView *select = [[NSBundle mainBundle] loadNibNamed:@"OrderListHeaderView" owner:self options:nil].firstObject;
//    select.layer.borderColor = RGB_MainColor.CGColor;
//    select.layer.borderWidth = 1.f;
    return select;
    
}


@end
