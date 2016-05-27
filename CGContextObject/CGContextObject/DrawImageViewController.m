//
//  DrawImageViewController.m
//  CGContextObject
//
//  Created by YouXianMing on 15/11/16.
//  Copyright © 2015年 ZiPeiYi. All rights reserved.
//

#import "DrawImageViewController.h"
#import "DrawImageView.h"

@interface DrawImageViewController ()

@property (nonatomic, strong) DrawImageView  *drawImageView;

@end

@implementation DrawImageViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self setup];
    
    self.drawImageView                   = [[DrawImageView alloc] initWithFrame:CGRectMake(0, 0, 250, 250)];
    self.drawImageView.layer.borderWidth = 0.5f;
    self.drawImageView.layer.borderColor = [UIColor grayColor].CGColor;
    self.drawImageView.center            = self.view.center;
    [self.view addSubview:self.drawImageView];
}

- (void)setup {
    
    self.view.backgroundColor = [UIColor whiteColor];
}

@end
