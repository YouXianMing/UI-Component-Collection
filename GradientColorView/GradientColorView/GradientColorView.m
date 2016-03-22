//
//  GradientColorView.m
//  GradientColorView
//
//  Created by YouXianMing on 15/12/15.
//  Copyright © 2015年 YouXianMing. All rights reserved.
//

#import "GradientColorView.h"

@interface GradientColorView ()

@property (nonatomic, strong) CAGradientLayer  *gradientLayer;

@end

@implementation GradientColorView

+ (Class)layerClass {
    
    return [CAGradientLayer class];
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {

        // Get the view's backed layer.
        _gradientLayer  = (CAGradientLayer *)self.layer;
        
        // Set default properties.
        self.locations  = @[@(0.25), @(0.5), @(0.75)];
        self.startPoint = CGPointMake(0, 0);
        self.endPoint   = CGPointMake(1, 0);
        self.colors     = @[(__bridge id)[UIColor redColor].CGColor,
                            (__bridge id)[UIColor greenColor].CGColor,
                            (__bridge id)[UIColor blueColor].CGColor];
    }
    
    return self;
}

- (void)becomeEffective {
    
    self.gradientLayer.startPoint = self.startPoint;
    self.gradientLayer.endPoint   = self.endPoint;
    self.gradientLayer.colors     = self.colors;
    self.gradientLayer.locations  = self.locations;
}

@end