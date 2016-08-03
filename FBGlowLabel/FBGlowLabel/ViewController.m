//
//  ViewController.m
//  FBGlowLabel
//
//  Created by YouXianMing on 16/8/3.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

#import "ViewController.h"
#import "FBGlowLabel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blackColor];
    
    FBGlowLabel *glowLabel    = [[FBGlowLabel alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:glowLabel];
    
    glowLabel.text            = @"壹擊必殺";
    glowLabel.textAlignment   = NSTextAlignmentCenter;
    glowLabel.backgroundColor = [UIColor clearColor];
    glowLabel.font            = [UIFont fontWithName:@"Heiti SC" size:40.f];
    glowLabel.textColor       = [[UIColor cyanColor] colorWithAlphaComponent:0.95f];
    
    glowLabel.glowSize       = 6;
    glowLabel.glowColor      = [UIColor cyanColor];
    
    glowLabel.innerGlowSize  = 3;
    glowLabel.innerGlowColor = [[UIColor blackColor] colorWithAlphaComponent:0.25f];
}

@end
