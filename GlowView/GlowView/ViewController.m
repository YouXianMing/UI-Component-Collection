//
//  ViewController.m
//  GlowView
//
//  Created by YouXianMing on 15/7/4.
//  Copyright (c) 2015年 YouXianMing. All rights reserved.
//

#import "ViewController.h"
#import "UIView+GlowView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    {
        UILabel *label  = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 50)];
        label.text      = @"YouXianMing";
        label.textColor = [UIColor blackColor];
        label.font      = [UIFont fontWithName:@"AppleSDGothicNeo-Thin" size:20.f];
        label.center    = self.view.center;
        [self.view addSubview:label];
        
        label.glowRadius        = @(4.f);
        label.glowOpacity       = @(1.f);
        label.glowColor         = [UIColor redColor];
        
        label.glowDuration          = @(1.f);
        label.hideDuration          = @(0.5f);
        label.glowAnimationDuration = @(1.f);
        
        [label createGlowLayer];
        [label insertGlowLayer];
        [label startGlowLoop];
    }
    
    {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(90, 350, 19, 30)];
        imageView.image        = [UIImage imageNamed:@"demo"];
        [self.view addSubview:imageView];
        
        imageView.glowRadius        = @(2.f);
        imageView.glowOpacity       = @(0.5f);
        imageView.glowColor         = [UIColor cyanColor];
        
        imageView.glowDuration          = @(1.f);
        imageView.hideDuration          = @(0.5f);
        imageView.glowAnimationDuration = @(1.f);
        
        [imageView createGlowLayer];
        [imageView insertGlowLayer];
        [imageView startGlowLoop];
    }
}

@end
