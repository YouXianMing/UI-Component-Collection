//
//  DrawRectViewController.m
//  CGContextObject
//
//  Created by YouXianMing on 15/11/12.
//  Copyright © 2015年 ZiPeiYi. All rights reserved.
//

#import "DrawRectViewController.h"
#import "DrawRectView.h"

@interface DrawRectViewController ()

@property (nonatomic, strong) DrawRectView  *drawRectView;
@property (nonatomic, strong) NSTimer       *timer;

@end

@implementation DrawRectViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self setup];
    
    self.drawRectView                   = [[DrawRectView alloc] initWithFrame:CGRectMake(0, 0, 250, 250)];
    self.drawRectView.layer.borderWidth = 0.5f;
    self.drawRectView.layer.borderColor = [UIColor grayColor].CGColor;
    self.drawRectView.center            = self.view.center;
    [self.view addSubview:self.drawRectView];
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.f target:self selector:@selector(event) userInfo:nil repeats:YES];
}

- (void)setup {
    
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)event {
    
    [self.drawRectView setNeedsDisplay];
}

@end
