//
//  ViewController.m
//  TransformationFadeView
//
//  Created by XianMingYou on 15/4/16.
//  Copyright (c) 2015年 XianMingYou. All rights reserved.
//

#import "ViewController.h"
#import "TranformFadeView.h"

typedef enum : NSUInteger {
    TYPE_ONE,
    TYPE_TWO,
} EType;

@interface ViewController ()

@property (nonatomic, strong) TranformFadeView *tranformFadeViewOne;
@property (nonatomic, strong) TranformFadeView *tranformFadeViewTwo;

@property (nonatomic, strong) NSTimer          *timer;
@property (nonatomic)         EType             type;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blackColor];

    // 图片1
    self.tranformFadeViewOne                 = [[TranformFadeView alloc] initWithFrame:self.view.bounds];
    self.tranformFadeViewOne.contentMode     = UIViewContentModeScaleAspectFill;
    self.tranformFadeViewOne.image           = [UIImage imageNamed:@"1"];
    self.tranformFadeViewOne.verticalCount   = 2;
    self.tranformFadeViewOne.horizontalCount = 12;
    self.tranformFadeViewOne.center          = self.view.center;
    [self.tranformFadeViewOne buildMaskView];
    
    self.tranformFadeViewOne.fadeDuradtion        = 1.f;
    self.tranformFadeViewOne.animationGapDuration = 0.1f;
    
    [self.view addSubview:self.tranformFadeViewOne];

    
    // 图片2
    self.tranformFadeViewTwo                 = [[TranformFadeView alloc] initWithFrame:self.view.bounds];
    self.tranformFadeViewTwo.contentMode     = UIViewContentModeScaleAspectFill;
    self.tranformFadeViewTwo.image           = [UIImage imageNamed:@"2"];
    self.tranformFadeViewTwo.verticalCount   = 2;
    self.tranformFadeViewTwo.horizontalCount = 12;
    self.tranformFadeViewTwo.center          = self.view.center;
    [self.tranformFadeViewTwo buildMaskView];
    
    self.tranformFadeViewTwo.fadeDuradtion        = 1.f;
    self.tranformFadeViewTwo.animationGapDuration = 0.1f;
    
    [self.view addSubview:self.tranformFadeViewTwo];
    [self.tranformFadeViewTwo fadeAnimated:YES];
    
    
    
    // 定时器
    self.timer = [NSTimer scheduledTimerWithTimeInterval:6
                                                  target:self
                                                selector:@selector(timerEvent)
                                                userInfo:nil
                                                 repeats:YES];
    self.type  = TYPE_ONE;
}

- (void)timerEvent {
    if (self.type == TYPE_ONE) {
        self.type = TYPE_TWO;
        
        [self.view sendSubviewToBack:self.tranformFadeViewTwo];
        [self.tranformFadeViewTwo showAnimated:NO];
        [self.tranformFadeViewOne fadeAnimated:YES];
        
    } else {
        self.type = TYPE_ONE;
        
        [self.view sendSubviewToBack:self.tranformFadeViewOne];
        [self.tranformFadeViewOne showAnimated:NO];
        [self.tranformFadeViewTwo fadeAnimated:YES];

    }
}

@end
