//
//  Light_Label.m
//  ProQ
//
//  Created by pengchunlian on 14/12/29.
//  Copyright (c) 2014年 com.flygps. All rights reserved.
//

#import "Light_Label.h"

@implementation Light_Label

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self){
        
        [self awakeFromNib];
        
    }
    
    return self;
}



-(void)awakeFromNib{
    
    [super awakeFromNib];
    
//    [ self setTextColor: ProQ_LightFontColor];
    
    
}


@end
