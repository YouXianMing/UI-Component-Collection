//
//  ProgressColor.m
//  ColorfulProgressView
//
//  Created by YouXianMing on 15/7/13.
//  Copyright (c) 2015年 YouXianMing. All rights reserved.
//

#import "ProgressColor.h"

@implementation ProgressColor

#pragma mark - 默认配置
- (instancetype)init {
    
    if (self = [super init]) {
        
        [self setup];
    }
    
    return self;
}

- (void)setup {
    
    self.startPoint = CGPointMake(0.f, 0.5f);
    self.endPoint   = CGPointMake(1.f, 0.5f);
    self.duration   = 0.1f;
}

#pragma mark - 切换颜色的算法
- (NSArray *)accessColors {
    
    NSMutableArray *mutable = [_cgColors mutableCopy];
    
    id last = [mutable lastObject];
    [mutable removeLastObject];
    [mutable insertObject:last atIndex:0];
    
    NSArray *colors = [NSArray arrayWithArray:mutable];
    
    return colors;
}

#pragma mark - 便利构造器
+ (ProgressColor *)redGradientColor {
    
    ProgressColor *color = [ProgressColor new];
    
    NSMutableArray *cgColors = [NSMutableArray array];
    
    [cgColors addObject:(id)[[UIColor colorWithRed:0.2f green:0.f blue:0.f alpha:1.f] CGColor]];
    [cgColors addObject:(id)[[UIColor colorWithRed:0.2f green:0.f blue:0.f alpha:1.f] CGColor]];
    [cgColors addObject:(id)[[UIColor colorWithRed:0.3f green:0.f blue:0.f alpha:1.f] CGColor]];
    [cgColors addObject:(id)[[UIColor colorWithRed:0.4f green:0.f blue:0.f alpha:1.f] CGColor]];
    [cgColors addObject:(id)[[UIColor colorWithRed:0.5f green:0.f blue:0.f alpha:1.f] CGColor]];
    [cgColors addObject:(id)[[UIColor colorWithRed:0.6f green:0.f blue:0.f alpha:1.f] CGColor]];
    [cgColors addObject:(id)[[UIColor colorWithRed:0.7f green:0.f blue:0.f alpha:1.f] CGColor]];
    [cgColors addObject:(id)[[UIColor colorWithRed:0.8f green:0.f blue:0.f alpha:1.f] CGColor]];
    [cgColors addObject:(id)[[UIColor colorWithRed:0.9f green:0.f blue:0.f alpha:1.f] CGColor]];
    [cgColors addObject:(id)[[UIColor colorWithRed:1.0f green:0.f blue:0.f alpha:1.f] CGColor]];
    [cgColors addObject:(id)[[UIColor colorWithRed:1.0f green:0.f blue:0.f alpha:1.f] CGColor]];
    [cgColors addObject:(id)[[UIColor colorWithRed:1.0f green:0.f blue:0.f alpha:1.f] CGColor]];
    [cgColors addObject:(id)[[UIColor colorWithRed:1.0f green:0.f blue:0.f alpha:1.f] CGColor]];
    [cgColors addObject:(id)[[UIColor colorWithRed:1.0f green:0.f blue:0.f alpha:1.f] CGColor]];
    [cgColors addObject:(id)[[UIColor colorWithRed:1.0f green:0.f blue:0.f alpha:1.f] CGColor]];
    [cgColors addObject:(id)[[UIColor colorWithRed:1.0f green:0.f blue:0.f alpha:1.f] CGColor]];
    [cgColors addObject:(id)[[UIColor colorWithRed:1.0f green:0.f blue:0.f alpha:1.f] CGColor]];
    [cgColors addObject:(id)[[UIColor colorWithRed:0.9f green:0.f blue:0.f alpha:1.f] CGColor]];
    [cgColors addObject:(id)[[UIColor colorWithRed:0.8f green:0.f blue:0.f alpha:1.f] CGColor]];
    [cgColors addObject:(id)[[UIColor colorWithRed:0.7f green:0.f blue:0.f alpha:1.f] CGColor]];
    [cgColors addObject:(id)[[UIColor colorWithRed:0.6f green:0.f blue:0.f alpha:1.f] CGColor]];
    [cgColors addObject:(id)[[UIColor colorWithRed:0.5f green:0.f blue:0.f alpha:1.f] CGColor]];
    [cgColors addObject:(id)[[UIColor colorWithRed:0.4f green:0.f blue:0.f alpha:1.f] CGColor]];
    [cgColors addObject:(id)[[UIColor colorWithRed:0.3f green:0.f blue:0.f alpha:1.f] CGColor]];
    [cgColors addObject:(id)[[UIColor colorWithRed:0.2f green:0.f blue:0.f alpha:1.f] CGColor]];
    [cgColors addObject:(id)[[UIColor colorWithRed:0.2f green:0.f blue:0.f alpha:1.f] CGColor]];
    
    color.cgColors = cgColors;
    color.duration = 0.1f;
    
    return color;
}

+ (ProgressColor *)yellowGradientColor {

    ProgressColor *color     = [ProgressColor new];
    NSMutableArray *cgColors = [NSMutableArray array];
    
    [cgColors addObject:(id)[[UIColor colorWithRed:0 green:0.1 blue:0.f alpha:1.f] CGColor]];
    [cgColors addObject:(id)[[UIColor colorWithRed:0 green:0.2 blue:0.f alpha:1.f] CGColor]];
    [cgColors addObject:(id)[[UIColor colorWithRed:0 green:0.3 blue:0.f alpha:1.f] CGColor]];
    [cgColors addObject:(id)[[UIColor colorWithRed:0 green:0.3 blue:0.f alpha:1.f] CGColor]];
    [cgColors addObject:(id)[[UIColor colorWithRed:0 green:0.2 blue:0.f alpha:1.f] CGColor]];
    [cgColors addObject:(id)[[UIColor colorWithRed:0 green:0.1 blue:0.f alpha:1.f] CGColor]];
    
    color.cgColors = cgColors;
    color.duration = 0.5f;
    
    return color;
}

@end
