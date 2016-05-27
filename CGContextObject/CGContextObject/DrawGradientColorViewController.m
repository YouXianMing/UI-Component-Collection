//
//  DrawGradientColorViewController.m
//  CGContextObject
//
//  Created by YouXianMing on 15/11/16.
//  Copyright © 2015年 ZiPeiYi. All rights reserved.
//

#import "DrawGradientColorViewController.h"
#import "DrawGradientColorView.h"

@interface DrawGradientColorViewController ()

@property (nonatomic, strong) DrawGradientColorView  *drawGradientColorView;
@property (nonatomic, strong) NSTimer                *timer;

@end

@implementation DrawGradientColorViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self setup];
    
    self.drawGradientColorView                   = [[DrawGradientColorView alloc] initWithFrame:CGRectMake(0, 0, 250, 250)];
    self.drawGradientColorView.layer.borderWidth = 0.5f;
    self.drawGradientColorView.layer.borderColor = [UIColor grayColor].CGColor;
    self.drawGradientColorView.center            = self.view.center;
    [self.view addSubview:self.drawGradientColorView];
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.f target:self selector:@selector(event) userInfo:nil repeats:YES];
}

- (void)setup {
    
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)event {
    
    [self.drawGradientColorView setNeedsDisplay];
}

@end
