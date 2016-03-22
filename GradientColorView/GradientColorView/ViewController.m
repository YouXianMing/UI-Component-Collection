//
//  ViewController.m
//  GradientColorView
//
//  Created by YouXianMing on 15/12/15.
//  Copyright © 2015年 YouXianMing. All rights reserved.
//

#import "ViewController.h"
#import "GradientColorView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    GradientColorView *gradientColorView = [[GradientColorView alloc] initWithFrame:self.view.bounds];
    [gradientColorView becomeEffective];
    
    [self.view addSubview:gradientColorView];
}

@end
