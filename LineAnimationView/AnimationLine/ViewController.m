//
//  ViewController.m
//  AnimationLine
//
//  Created by YouXianMing on 15/7/4.
//  Copyright (c) 2015年 YouXianMing. All rights reserved.
//

#import "ViewController.h"
#import "LineAnimationView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIView *redView = [[UIView alloc] initWithFrame:CGRectMake(100 - 5, 100, 3, 20 / 2)];
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];
    
    LineAnimationView *lineAnimationView1 = [[LineAnimationView alloc] initWithFrame:CGRectMake(100, 100, 200 / 2, 20 / 2)];
    lineAnimationView1.sourceImage        = [UIImage imageNamed:@"demo"];
    lineAnimationView1.animationType      = RIGHT_TO_LEFT;
    [self.view addSubview:lineAnimationView1];
    [lineAnimationView1 startAnimation];
    
    LineAnimationView *lineAnimationView2 = [[LineAnimationView alloc] initWithFrame:CGRectMake(100, 140, 720 / 6.f, 18 / 6.f)];
    lineAnimationView2.sourceImage        = [UIImage imageNamed:@"demo2"];
    lineAnimationView2.animationType      = LEFT_TO_RIGHT;
    lineAnimationView2.duration           = 3.f;
    lineAnimationView2.alpha              = 0.3f;
    [self.view addSubview:lineAnimationView2];
    [lineAnimationView2 startAnimation];
}

@end
