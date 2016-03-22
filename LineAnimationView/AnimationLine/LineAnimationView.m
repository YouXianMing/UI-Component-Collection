//
//  LineAnimationView.m
//  AnimationLine
//
//  Created by YouXianMing on 15/7/4.
//  Copyright (c) 2015年 YouXianMing. All rights reserved.
//

#import "LineAnimationView.h"

@interface LineAnimationView ()

@property (nonatomic, strong) UIView *contentView;

@property (nonatomic, strong) UIImageView *leftImageView;
@property (nonatomic, strong) UIImageView *rightImageView;

@end

@implementation LineAnimationView

#pragma mark - 初始化
- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        [self defaultConfig];
        
        [self setup];
    }
    
    return self;
}

- (void)defaultConfig {

    self.layer.masksToBounds = YES;
}

- (void)setup {

    CGFloat width       = self.frame.size.width;
    CGFloat height      = self.frame.size.height;
    
    self.contentView    = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width * 2, height)];
    [self addSubview:self.contentView];
    
    self.leftImageView  = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, width, height)];
    [self.contentView addSubview:self.leftImageView];
    
    self.rightImageView = [[UIImageView alloc] initWithFrame:CGRectMake(width, 0, width, height)];
    [self.contentView addSubview:self.rightImageView];
    
    _animationType = LEFT_TO_RIGHT;
    _duration      = 1.f;
}

#pragma mark - 开始动画
- (void)startAnimation {
    
    if (_animationType == LEFT_TO_RIGHT) {
        
        CGFloat width          = self.frame.size.width;
        CGFloat height         = self.frame.size.height;
        
        CGRect startRect       = CGRectMake(0, 0, width * 2, height);
        CGRect endRect         = CGRectMake(-width, 0, width * 2, height);
        
        _contentView.frame     = startRect;
        
        CABasicAnimation *line   = [CABasicAnimation animationWithKeyPath:@"bounds"];
        line.fromValue           = [NSValue valueWithCGRect:startRect];
        line.toValue             = [NSValue valueWithCGRect:endRect];
        line.removedOnCompletion = YES;
        line.fillMode            = kCAFillModeForwards;
        line.timingFunction      = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
        line.duration            = _duration;
        line.delegate            = self;
        
        _contentView.frame     = endRect;
        [_contentView.layer addAnimation:line forKey:nil];
        
    } else if (_animationType == RIGHT_TO_LEFT) {
    
        CGFloat width          = self.frame.size.width;
        CGFloat height         = self.frame.size.height;
        
        CGRect startRect       = CGRectMake(- width, 0, width * 2, height);
        CGRect endRect         = CGRectMake(0, 0, width * 2, height);
        
        _contentView.frame     = startRect;
        
        CABasicAnimation *line   = [CABasicAnimation animationWithKeyPath:@"bounds"];
        line.fromValue           = [NSValue valueWithCGRect:startRect];
        line.toValue             = [NSValue valueWithCGRect:endRect];
        line.removedOnCompletion = YES;
        line.fillMode            = kCAFillModeForwards;
        line.timingFunction      = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
        line.duration            = _duration;
        line.delegate            = self;
        
        _contentView.frame     = startRect;
        [_contentView.layer addAnimation:line forKey:nil];
        
    }
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {

    [self startAnimation];
}

#pragma mark - 重写setter，getter方法
@synthesize sourceImage = _sourceImage;
- (void)setSourceImage:(UIImage *)sourceImage {

    _sourceImage          = sourceImage;
    _leftImageView.image  = sourceImage;
    _rightImageView.image = sourceImage;
}

- (UIImage *)sourceImage {
    
    return _sourceImage;
}

@end
