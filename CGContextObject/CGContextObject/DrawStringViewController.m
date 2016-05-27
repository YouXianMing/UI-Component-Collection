//
//  DrawStringViewController.m
//  CGContextObject
//
//  Created by YouXianMing on 15/11/16.
//  Copyright © 2015年 ZiPeiYi. All rights reserved.
//

#import "DrawStringViewController.h"
#import "DrawStringView.h"

@interface DrawStringViewController ()

@property (nonatomic, strong) DrawStringView  *drawStringView;
@property (nonatomic, strong) NSTimer         *timer;

@end

@implementation DrawStringViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self setup];
    
    self.drawStringView                   = [[DrawStringView alloc] initWithFrame:CGRectMake(0, 0, 250, 250)];
    self.drawStringView.layer.borderWidth = 0.5f;
    self.drawStringView.layer.borderColor = [UIColor grayColor].CGColor;
    self.drawStringView.center            = self.view.center;
    [self.view addSubview:self.drawStringView];
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.f target:self selector:@selector(event) userInfo:nil repeats:YES];
}

- (void)setup {
    
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)event {
    
    [self.drawStringView setNeedsDisplay];
}

@end
