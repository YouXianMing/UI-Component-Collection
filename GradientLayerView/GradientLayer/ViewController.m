//
//  ViewController.m
//  GradientLayer
//
//  Created by YouXianMing on 15/5/15.
//  Copyright (c) 2015年 YouXianMing. All rights reserved.
//

#import "ViewController.h"
#import "AngleGradientView.h"
#import "CircleView.h"


#define  Width   [UIScreen mainScreen].bounds.size.width
#define  Height  [UIScreen mainScreen].bounds.size.height

@interface ViewController ()


@property (nonatomic, strong) AngleGradientView  *gradientMetal1View;
@property (nonatomic, strong) AngleGradientView  *gradientMetal2View;
@property (nonatomic, strong) AngleGradientView  *gradientRainbowView;


@property (nonatomic, strong) NSTimer            *timer;


@property (nonatomic, strong) CircleView  *circleMask;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 创建金属风格的view
    self.gradientMetal1View = [AngleGradientView gradientViewWithFrame:CGRectMake(0, 0, Width/2.f, Width/2.f)
                                                          gradientType:GradientMetalTypeOne];
    [self.view addSubview:self.gradientMetal1View];
    
    // 创建金属风格的view
    self.gradientMetal2View = [AngleGradientView gradientViewWithFrame:CGRectMake(Width/2.f, 0, Width/2.f, Width/2.f)
                                                          gradientType:GradientMetalTypeTwo];
    [self.view addSubview:self.gradientMetal2View];
    
    // 创建彩虹风格的view
    self.gradientRainbowView = [AngleGradientView gradientViewWithFrame:CGRectMake(0, Width/2.f, Width/2.f, Width/2.f)
                                                           gradientType:GradientRainbow];
    [self.view addSubview:self.gradientRainbowView];
    
    // 带mask的彩虹风格的view
    self.circleMask = [CircleView circleViewWithFrame:CGRectMake(0, 0, Width/2.f, Width/2.f)
                                            lineWidth:Width/4.f
                                            lineColor:[UIColor blackColor]
                                            clockWise:NO
                                           startAngle:180];
    [self.circleMask buildView];
    AngleGradientView *ranbowView = \
    [AngleGradientView gradientViewWithFrame:CGRectMake(Width/2.f, Width/2.f, Width/2.f, Width/2.f)
                                gradientType:GradientRainbow];
    [self.view addSubview:ranbowView];
    ranbowView.maskView = self.circleMask;
    
    
    
    // 定时器
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.f
                                                  target:self
                                                selector:@selector(timerEvent)
                                                userInfo:nil
                                                 repeats:YES];
    
}

- (void)timerEvent {
    CGFloat percent        = arc4random() % 100 / 100.f;
    CGFloat anotherPercent = arc4random() % 100 / 100.f;
    [self.circleMask strokeStart:(percent < anotherPercent ? percent : anotherPercent)
                   animationType:ExponentialEaseInOut
                        animated:YES duration:1.f];
    [self.circleMask strokeEnd:(percent < anotherPercent ? anotherPercent : percent)
                 animationType:ExponentialEaseInOut
                      animated:YES duration:1.f];
}

@end
