//
//  ColorfulProgressView.h
//  ColorfulProgressView
//
//  Created by YouXianMing on 15/7/13.
//  Copyright (c) 2015年 YouXianMing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProgressColor.h"

@interface ColorfulProgressView : UIView

/**
 *  进度
 */
@property (nonatomic) CGFloat progress;

/**
 *  进度颜色(不设置的话有默认值)
 */
@property (nonatomic, strong) ProgressColor *progressColor;

/**
 *  配置生效以及开始运行
 */
- (void)configAvailableAndBegin;

/**
 *  便利构造器方法
 *
 *  @param frame         尺寸
 *  @param progressColor 颜色值,可以为空
 *
 *  @return 实例对象
 */
+ (instancetype)colorfulProgressViewWithFrame:(CGRect)frame progressColor:(ProgressColor *)progressColor;

@end
