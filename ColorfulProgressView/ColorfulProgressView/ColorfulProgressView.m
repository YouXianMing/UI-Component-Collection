//
//  ColorfulProgressView.m
//  ColorfulProgressView
//
//  Created by YouXianMing on 15/7/13.
//  Copyright (c) 2015年 YouXianMing. All rights reserved.
//

#import "ColorfulProgressView.h"

@interface ColorfulProgressView () {

    /**
     *  当前view宽度
     */
    CGFloat _width;
    
    /**
     *  当前view高度
     */
    CGFloat _height;
}

@property (nonatomic, strong) UIView          *baseView;
@property (nonatomic, strong) CAGradientLayer *gradientLayer;

@end

@implementation ColorfulProgressView

#pragma mark - 初始化与初始设置
- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        [self setup];
    }
    
    return self;
}

- (void)setup {

    _width  = self.frame.size.width;
    _height = self.frame.size.height;
    
    // baseView
    self.baseView                     = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, _height)];
    self.baseView.layer.masksToBounds = YES;
    [self addSubview:self.baseView];
    
    // 渐变色Layer
    self.gradientLayer            = [CAGradientLayer layer];
    self.gradientLayer.frame      = self.bounds;
    [self.baseView.layer addSublayer:self.gradientLayer];
}

#pragma mark - 
- (void)configAvailableAndBegin {

    // 如果没有设置ProgressColor,则自己生成一个
    if (_progressColor == nil) {
        
        _progressColor = [ProgressColor new];
        
        NSMutableArray *cgColors = [NSMutableArray array];
        for (NSInteger deg = 0; deg <= 360; deg += 5) {
            UIColor *color = [UIColor colorWithHue:1.0 * deg / 360.0 saturation:1.0 brightness:1.0 alpha:1.0];
            [cgColors addObject:(id)[color CGColor]];
        }
        
        _progressColor.cgColors = cgColors;
    }
    
    self.gradientLayer.colors     = _progressColor.cgColors;
    self.gradientLayer.startPoint = _progressColor.startPoint;
    self.gradientLayer.endPoint   = _progressColor.endPoint;
    
    [self doAnimation];
}

- (void)doAnimation {
    
    NSArray *fromColors           = _progressColor.cgColors;
    NSArray *toColors             = [_progressColor accessColors];
    _progressColor.cgColors       = toColors;
    
    CABasicAnimation *animation   = [CABasicAnimation animationWithKeyPath:@"colors"];
    
    animation.fromValue           = fromColors;
    animation.toValue             = toColors;
    animation.duration            = _progressColor.duration;
    
    animation.removedOnCompletion = YES;
    animation.fillMode            = kCAFillModeForwards;
    animation.timingFunction      = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    animation.delegate            = self;
    
    self.gradientLayer.colors     = toColors;
    
    [self.gradientLayer addAnimation:animation forKey:@"animateGradient"];
}

#pragma mark - 动画代理
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    
    [self doAnimation];
}

#pragma mark - 便利构造器
+ (instancetype)colorfulProgressViewWithFrame:(CGRect)frame progressColor:(ProgressColor *)progressColor {

    ColorfulProgressView *progressView = [[self alloc] initWithFrame:frame];
    
    if (progressColor) {
        
        progressView.progressColor = progressColor;
    }
    
    [progressView configAvailableAndBegin];
    
    return progressView;
}

#pragma mark - 重写getter,setter方法
@synthesize progress = _progress;
- (void)setProgress:(CGFloat)progress {

    _progress = progress;
    
    if (progress <= 0) {
        
        _baseView.frame = CGRectMake(0, 0, 0, _height);
        
    } else if (progress <= 1) {
        
        _baseView.frame = CGRectMake(0, 0, _progress * _width, _height);
        
    } else {
        
        _baseView.frame = CGRectMake(0, 0, _width, _height);
    }
}

- (CGFloat)progress {

    return _progress;
}

@end
