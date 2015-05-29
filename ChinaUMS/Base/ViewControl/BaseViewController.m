//
//  LHBaseViewController.m
//  LaHuo
//
//  Created by ljh on 14-10-23.
//  Copyright (c) 2014年 LaHuo. All rights reserved.
//

#import "BaseViewController.h"
#import "BaseNavigationController.h"

#ifdef XcodeAppVersion
#import "MobClick.h"
#endif

@interface BaseViewController ()

@end

@implementation BaseViewController


-(void)viewDidLoad
{
    [super viewDidLoad];
//    [self.view setBackgroundColor:TYToO_BGColor];
//    if (self.navigationController.viewControllers.count > 1) {
//       
//        self.navigationItem.leftBarButtonItem =  [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"icon_productDetails_return"] style:UIBarButtonItemStyleDone target:self action:@selector(popToVC)];
//    }
    self.view.backgroundColor = RGB_backColor;

}




- (void)enablePopGes
{
    BaseNavigationController *nav =  (id)self.navigationController;
    if ([nav isKindOfClass:[BaseNavigationController class]])
    {
        if (nav.visibleViewController == self)
        {
            nav.canPop = YES;
        }
    }

}


- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(enablePopGes) object:nil];


    if (self.navigationController.viewControllers.count > 1)
    {
        self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    }
    else
    {
       self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    }
    
}


-(void)popToVC
{
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];

}

- (UIRectEdge)edgesForExtendedLayout {
    return UIRectEdgeNone;
}









@end
