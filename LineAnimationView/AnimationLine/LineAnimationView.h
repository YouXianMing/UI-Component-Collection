//
//  LineAnimationView.h
//  AnimationLine
//
//  Created by YouXianMing on 15/7/4.
//  Copyright (c) 2015年 YouXianMing. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    
    /**
     *  从左往右（默认）
     */
    LEFT_TO_RIGHT,
    
    /**
     *  从右往左
     */
    RIGHT_TO_LEFT,

} ELineAnimationType;

@interface LineAnimationView : UIView

/**
 *  动画时间间隔（默认时间为 1 秒）
 */
@property (nonatomic) NSTimeInterval      duration;

/**
 *  动画类型（默认为从左到右）
 */
@property (nonatomic) ELineAnimationType  animationType;

/**
 *  素材图片
 */
@property (nonatomic, strong) UIImage    *sourceImage;

/**
 *  开始执行动画
 */
- (void)startAnimation;

@end
