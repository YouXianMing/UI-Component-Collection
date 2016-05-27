//
//  DrawLineViewController.m
//  CGContextObject
//
//  Created by YouXianMing on 15/11/12.
//  Copyright © 2015年 ZiPeiYi. All rights reserved.
//

#import "DrawLineViewController.h"
#import "DrawLineView.h"

@interface DrawLineViewController ()

@property (nonatomic, strong) DrawLineView  *drawLineView;
@property (nonatomic, strong) NSTimer       *timer;

@end

@implementation DrawLineViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self setup];
    
    self.drawLineView                   = [[DrawLineView alloc] initWithFrame:CGRectMake(0, 0, 250, 250)];
    self.drawLineView.layer.borderWidth = 0.5f;
    self.drawLineView.layer.borderColor = [UIColor grayColor].CGColor;
    self.drawLineView.center            = self.view.center;
    [self.view addSubview:self.drawLineView];
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.f target:self selector:@selector(event) userInfo:nil repeats:YES];
}

- (void)setup {

    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)event {
    
    [self.drawLineView setNeedsDisplay];
}

@end
