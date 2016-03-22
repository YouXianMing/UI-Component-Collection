//
//  AngleGradientView.h
//  GradientLayer
//
//  Created by YouXianMing on 15/5/15.
//  Copyright (c) 2015年 YouXianMing. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    
    /**
     *  金属风格
     */
    GradientMetalTypeOne,
    GradientMetalTypeTwo,
    
    /**
     *  彩虹风格
     */
    GradientRainbow,
    
    
    test,
    
    
} EAngleGradientType;

@interface AngleGradientView : UIView

/**
 *  返回带环形渐变颜色的view
 *
 *  @param frame     尺寸
 *  @param colors    颜色数组(CGColor)
 *  @param locations 颜色分割点数组(范围取值为[0, 1], 渐变递增,需要包含0与1这两个点)
 *
 *  @return 创建好的带环形渐变的view
 */
- (instancetype)initWithFrame:(CGRect)frame
                 withCGColors:(NSArray *)colors
                withLocations:(NSArray *)locations;


/**
 *  便利构造器,便捷的创建出指定风格的渐变环形的view
 *
 *  @param frame 尺寸
 *  @param type  指定的风格
 *
 *  @return 创建好的带环形渐变的view
 */
+ (instancetype)gradientViewWithFrame:(CGRect)frame
                         gradientType:(EAngleGradientType)type;


@end
