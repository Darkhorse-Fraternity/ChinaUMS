//
//  TonyTextField.m
//  weiding
//
//  Created by leeco on 14-6-30.
//  Copyright (c) 2014年 com.flygps. All rights reserved.
//

#import "TonyTextField.h"

@implementation TonyTextField


- (void)awakeFromNib
{
    [super awakeFromNib];
    
    [self setUp];
}


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self){
        [self setUp];
    }
    
    return self;
}



-(void)setUp
{
    [self setBorderStyle:UITextBorderStyleNone];
    [self setFont: [UIFont systemFontOfSize:17]];
    [self setTintColor:[UIColor colorWithRed:0.0 green:122.0/255.0 blue:1.0 alpha:1.0]];
    [self setBackgroundColor:[UIColor whiteColor]];
    [self setClearButtonMode:UITextFieldViewModeWhileEditing];
    self.layer.masksToBounds = YES;
    [self.layer setBorderWidth:0.8];
    [self.layer setBorderColor: [UIColor colorWithWhite:0.1 alpha:0.2].CGColor];
    
}


- (CGRect)textRectForBounds:(CGRect)bounds
{
    return CGRectInset(bounds, 10, 5);
}

- (CGRect)editingRectForBounds:(CGRect)bounds
{
    return CGRectInset(bounds, 10, 5);
}


- (void) drawPlaceholderInRect:(CGRect)rect {
    float size;
    if (rect.size.height>30.f) {
        size =15;
    }else{
        size =13;
    }
    
    NSDictionary *attributes = @{ NSFontAttributeName: [UIFont systemFontOfSize:size], NSForegroundColorAttributeName : [UIColor colorWithRed:182/255. green:182/255. blue:183/255. alpha:1.0]};
    CGRect  myRect = CGRectMake(rect.origin.x, rect.origin.y+(17-size), rect.size.width, rect.size.height);
    
    
    if (rect.size.height>25.f) {
        [self.placeholder drawInRect:CGRectInset(myRect, 5, 5) withAttributes:attributes];
    }else{
        [self.placeholder drawInRect:CGRectInset(myRect, 3, -1) withAttributes:attributes];
    }
  
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
