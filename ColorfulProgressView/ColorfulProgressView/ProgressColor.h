//
//  ProgressColor.h
//  ColorfulProgressView
//
//  Created by YouXianMing on 15/7/13.
//  Copyright (c) 2015年 YouXianMing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ProgressColor : NSObject

/**
 *  存储的是CGColor的数组元素
 */
@property (nonatomic, strong) NSArray *cgColors;

/**
 *  颜色起始点
 */
@property (nonatomic) CGPoint startPoint;

/**
 *  颜色结束点
 */
@property (nonatomic) CGPoint endPoint;

/**
 *  颜色移位一次的动画时间
 */
@property (nonatomic) NSTimeInterval duration;

/**
 *  -----------[ 子类可以重写该方法 ]-----------
 *
 *  转换颜色的算法
 *
 *  @return 移位后的颜色数组
 */
- (NSArray *)accessColors;

#pragma mark - 便利构造器方法(自己添加方法)
+ (ProgressColor *)redGradientColor;

+ (ProgressColor *)yellowGradientColor;

@end
