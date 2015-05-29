//
//  OrderListHeaderView.h
//  ChinaUMS
//
//  Created by  FLY_TonyYO on 15/4/12.
//  Copyright (c) 2015年  FLY_TonyYO. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IQDropDownTextField.h"
@interface OrderListHeaderView : UIView
+(OrderListHeaderView *)setUpOrderListHeaderView;
@property (weak, nonatomic) IBOutlet UITextField *searchTextFiled;
@property (weak, nonatomic) IBOutlet UIButton *searchBtn;
@property (weak, nonatomic) IBOutlet IQDropDownTextField *OrderTypeTextField;
@property (weak, nonatomic) IBOutlet IQDropDownTextField *SearchConditionTextField;
@end
