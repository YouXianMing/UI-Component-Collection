//
//  ViewController.m
//  BadgeValueView
//
//  Created by YouXianMing on 16/6/9.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

#import "ViewController.h"
#import "BadgeValueView.h"
#import "GCD.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    UIView *rectView           = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    rectView.layer.borderWidth = 0.5f;
    rectView.layer.borderColor = [[UIColor blackColor] colorWithAlphaComponent:0.5].CGColor;
    rectView.center            = self.view.center;
    [self.view addSubview:rectView];
    
    {
        BadgeValueView *badgeView = [[BadgeValueView alloc] init];
        badgeView.contentView     = rectView;
        badgeView.sensitiveWidth  = 30.f;
        [badgeView makeEffect];
        badgeView.badgeValue = @"Good";
        
        [GCDQueue executeInMainQueue:^{
            
            badgeView.badgeValue = @"GCDQueue";
            
        } afterDelaySecs:5.f];
    }
    
    {
        BadgeValueView *badgeView = [[BadgeValueView alloc] init];
        badgeView.contentView     = rectView;
        badgeView.position        = BadgePositionTopLeft;
        badgeView.badgeColor      = [UIColor blackColor];
        badgeView.sensitiveWidth  = 30.f;
        [badgeView makeEffect];
        badgeView.badgeValue = @"0";
        
        [GCDQueue executeInMainQueue:^{
            
            badgeView.badgeValue = @"10000+";
            
        } afterDelaySecs:5.f];
    }
}

@end
