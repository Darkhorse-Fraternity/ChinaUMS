//
//  TonyScrollView.m
//  weiding
//
//  Created by TYToO on 14-7-11.
//  Copyright (c) 2014年 com.flygps. All rights reserved.
//

#import "TonyScrollView.h"

@implementation TonyScrollView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUp];
    }
    return self;
}


-(void)awakeFromNib
{
    [super awakeFromNib];
    [self setUp];
}

-(void)setUp
{
    UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyBoard:)];
    [self addGestureRecognizer:gestureRecognizer];
}
-(void)hideKeyBoard:(UITapGestureRecognizer *)tap
{
    [self endEditing:YES];
}

@end
