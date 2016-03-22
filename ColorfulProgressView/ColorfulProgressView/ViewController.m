//
//  ViewController.m
//  ColorfulProgressView
//
//  Created by YouXianMing on 15/7/13.
//  Copyright (c) 2015年 YouXianMing. All rights reserved.
//

#import "ViewController.h"
#import "ColorfulProgressView.h"

// 宽度
#define  Width  [UIScreen mainScreen].bounds.size.width

@interface ViewController ()

@property (nonatomic, strong) ColorfulProgressView *progressView1;
@property (nonatomic, strong) ColorfulProgressView *progressView2;

@property (nonatomic, strong) NSTimer              *timer;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blackColor];

    self.progressView1 = [ColorfulProgressView colorfulProgressViewWithFrame:CGRectMake(0, 100, Width, 1)
                                                               progressColor:nil];
    [self.view addSubview:self.progressView1];
    
    self.progressView2 = [ColorfulProgressView colorfulProgressViewWithFrame:CGRectMake(0, 120, Width, 1)
                                                               progressColor:[ProgressColor redGradientColor]];
    [self.view addSubview:self.progressView2];

    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.f target:self selector:@selector(timerEvent) userInfo:nil repeats:YES];
}

- (void)timerEvent {

    CGFloat percent1 = arc4random() % 101 / 100.f;
    CGFloat percent2 = arc4random() % 101 / 100.f;
    
    [UIView animateWithDuration:0.5f delay:0.f usingSpringWithDamping:1.f initialSpringVelocity:0.f options:0 animations:^{
        
        self.progressView1.progress = percent1;
        self.progressView2.progress = percent2;
        
    } completion:^(BOOL finished) {
        
    }];
}

@end
