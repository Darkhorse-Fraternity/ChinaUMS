//
//  Orange_Button.m
//  ProQ
//
//  Created by pengchunlian on 14/12/29.
//  Copyright (c) 2014年 com.flygps. All rights reserved.
//

#import "Orange_Button.h"

@implementation Orange_Button


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
}


-(void)layoutSubviews{
    [super layoutSubviews];
    [self setUp];
    
}

-(void)setUp
{
    
    [self setBackgroundImage:[UIImage imageNamed:@"Orange_button_background"] forState:UIControlStateNormal];
    [self setBackgroundImage:[UIImage imageNamed:@"button_in"] forState:UIControlStateDisabled];
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self setTitleShadowColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.layer.cornerRadius = 2.f;
    
}





@end
