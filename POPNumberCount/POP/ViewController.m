//
//  ViewController.m
//  POP
//
//  Created by XianMingYou on 15/4/10.
//  Copyright (c) 2015年 XianMingYou. All rights reserved.
//

#import "ViewController.h"
#import "PercentCount.h"

@interface ViewController ()<POPNumberCountDelegate>

@property (nonatomic, strong) PercentCount *numberCount;
@property (nonatomic, strong) UILabel      *label;
@property (nonatomic, strong) NSTimer      *timer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 显示用label
    [self.view addSubview:self.label];
    
    // 配置
    self.numberCount          = [PercentCount new];
    self.numberCount.delegate = self;
    [self configNumberCount];
    [self.numberCount startAnimation];
    
    // 初始化定时器
    self.timer = [NSTimer scheduledTimerWithTimeInterval:3.f
                                                  target:self
                                                selector:@selector(timerEvent)
                                                userInfo:nil
                                                 repeats:YES];
}

- (void)configNumberCount {
    // 进行值的配置
    self.numberCount.fromValue      = self.numberCount.currentValue;
    self.numberCount.toValue        = (arc4random() % 100 / 1.f);
    self.numberCount.duration       = 2.f;
    self.numberCount.timingFunction = [CAMediaTimingFunction functionWithControlPoints:0.69 :0.11 :0.32 :0.88];
    [self.numberCount saveValues];
}

- (void)timerEvent {
    [self configNumberCount];
    
    // 执行动画
    [self.numberCount startAnimation];
}

- (UILabel *)label {
    if (_label == nil) {
        _label = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 320, 100)];
    }
    
    return _label;
}

- (void)numberCount:(POPNumberCount *)numberCount currentAttributedString:(NSAttributedString *)string {
    self.label.attributedText = string;
}

@end
