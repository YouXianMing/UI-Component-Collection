//
//  ViewController.m
//  CircleView
//
//  Created by YouXianMing on 15/11/12.
//  Copyright (c) 2015年 YouXianMing. All rights reserved.
//

#import "ViewController.h"
#import "CircleView.h"

@interface ViewController ()

@property (nonatomic, strong) CircleView  *circleView1;
@property (nonatomic, strong) CircleView  *circleView2;
@property (nonatomic, strong) CircleView  *circleView3;
@property (nonatomic, strong) CircleView  *circleView4;

@property (nonatomic, strong) NSTimer     *timer;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];

    // 圆圈1
    self.circleView1 = [CircleView circleViewWithFrame:CGRectMake(20, 20, 140, 140) lineWidth:2 lineColor:[UIColor grayColor]
                                             clockWise:YES startAngle:0];
    [self.circleView1 buildView];
    [self.view addSubview:self.circleView1];

    // 圆圈2
    self.circleView2 = [CircleView circleViewWithFrame:CGRectMake(20 + 150, 20, 140, 140) lineWidth:70 lineColor:[UIColor blackColor]
                                             clockWise:YES startAngle:0];
    [self.circleView2 buildView];
    [self.view addSubview:self.circleView2];
    
    // 圆圈3
    self.circleView3 = [CircleView circleViewWithFrame:CGRectMake(20 + 150, 20 + 150, 140, 140) lineWidth:2 lineColor:[UIColor blackColor]
                                             clockWise:YES startAngle:0];
    [self.circleView3 buildView];
    [self.view addSubview:self.circleView3];
    
    // 圆圈4
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 20 + 150, 140, 140)];
    imageView.image        = [UIImage imageNamed:@"colors"];
    [self.view addSubview:imageView];
    self.circleView4 = [CircleView circleViewWithFrame:CGRectMake(0, 0, 140, 140) lineWidth:70 lineColor:[UIColor blackColor]
                                             clockWise:YES startAngle:0];
    [self.circleView4 buildView];
    imageView.layer.mask = self.circleView4.layer;
    
    // 定时器
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.5 target:self selector:@selector(runEvent) userInfo:nil repeats:YES];
}

- (void)runEvent {
    
    CGFloat percent        = arc4random() % 100 / 100.f;
    CGFloat anotherPercent = arc4random() % 100 / 100.f;
    
    // 圆圈1动画
    [self.circleView1 strokeEnd:percent animationType:ElasticEaseInOut animated:YES duration:1.f];
    
    // 圆圈2动画
    [self.circleView2 strokeEnd:percent animationType:ExponentialEaseInOut animated:YES duration:1.f];
    
    // 圆圈3动画
    [self.circleView3 strokeStart:(percent < anotherPercent ? percent : anotherPercent) animationType:ExponentialEaseInOut
                         animated:YES duration:1.f];
    [self.circleView3 strokeEnd:(percent < anotherPercent ? anotherPercent : percent) animationType:ExponentialEaseInOut
                       animated:YES duration:1.f];
    
    // 圆圈4动画
    [self.circleView4 strokeEnd:percent animationType:ExponentialEaseOut animated:YES duration:1.f];
}

@end
