//
//  LHBaseNavigationController.m
//  LaHuo
//
//  Created by ljh on 14-10-23.
//  Copyright (c) 2014年 LaHuo. All rights reserved.
//

#import "BaseNavigationController.h"


@interface BaseNavigationController ()<UIGestureRecognizerDelegate>

@end

@implementation BaseNavigationController


- (id)initWithRootViewController:(UIViewController *)rootViewController
{
    self = [super initWithRootViewController:rootViewController];
    if (self)
    {
        [self awakeFromNib];
//        [[LKThemeManager shareThemeManager] addChangedListener:self];
    }
    return self;
}

-(void)awakeFromNib
{
    self.canPop = YES;
    
    if (IOS7)
    {
        self.interactivePopGestureRecognizer.delegate = (id <UIGestureRecognizerDelegate>) self;
        self.delegate = (id <UINavigationControllerDelegate>) self;
    }
    [self appThemeDidChanged];
}


-(void)appThemeDidChanged
{
    NSMutableDictionary *titleTextAttributes = [[NSMutableDictionary alloc] init];
    titleTextAttributes[NSFontAttributeName] = [UIFont boldSystemFontOfSize:20];
    titleTextAttributes[NSForegroundColorAttributeName] = [UIColor whiteColor];
//    titleTextAttributes[NSShadowAttributeName] = [UIColor clearColor];
//    titleTextAttributes[NSShadowAttributeName] = [NSValue valueWithCGSize:CGSizeMake(0, 0)];
    self.navigationBar.titleTextAttributes = titleTextAttributes;
//    [self.navigationBar setBackgroundImage:[UIImage lk_imageCenterStretchWithName:@"test"] forBarMetrics:UIBarMetricsDefault];
    [self.navigationBar setBarTintColor:RGB_MainColor];
    [self.navigationBar setTintColor:[UIColor whiteColor]];
  
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0)
    {
        viewController.hidesBottomBarWhenPushed = YES;

    }
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)])
    {
        self.interactivePopGestureRecognizer.enabled = NO;
    }
    [self.visibleViewController.view endEditing:YES];
    [super pushViewController:viewController animated:animated];
}

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}

- (BOOL)shouldAutorotate
{
    return NO;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return interfaceOrientation == UIInterfaceOrientationPortrait;
}

- (void)navigationController:(UINavigationController *)navigationController
       didShowViewController:(UIViewController *)viewController
                    animated:(BOOL)animate
{
    self.canPop = YES;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldBeRequiredToFailByGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    self.canPop = NO;
    return YES;
}

-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    if ([gestureRecognizer isKindOfClass:NSClassFromString(@"UIScreenEdgePanGestureRecognizer")])
    {
        BOOL flag = (self.canPop && self.viewControllers.count > 1);
        if (self.retryCount >= 2)
        {
            flag = YES;
            self.canPop = YES;
            self.retryCount = 0;
        }
        if (!flag)
        {
            self.retryCount++;
        }
        return flag;
    }
    return YES;
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

@end
