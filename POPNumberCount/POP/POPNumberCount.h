//
//  POPNumberCount.h
//  POP
//
//  Created by XianMingYou on 15/4/10.
//  Copyright (c) 2015年 XianMingYou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "POP.h"

@class POPNumberCount;

@protocol POPNumberCountDelegate <NSObject>
@optional
/**
 *  最原始的方法
 *
 *  @param numberCount 对象自己
 *  @param number      变化的值
 */
- (void)numberCount:(POPNumberCount *)numberCount currentNumber:(NSNumber *)number;

/**
 *  子类可以实现的方法
 *
 *  @param numberCount 对象自己
 *  @param string      子类返回的富文本
 */
- (void)numberCount:(POPNumberCount *)numberCount currentAttributedString:(NSAttributedString *)string;

/**
 *  子类可以实现的方法
 *
 *  @param numberCount 对象自己
 *  @param string      子类返回的文本
 */
- (void)numberCount:(POPNumberCount *)numberCount currentString:(NSString *)string;

@end


@interface POPNumberCount : NSObject

@property (nonatomic, weak)   id<POPNumberCountDelegate> delegate;       // 代理

@property (nonatomic, assign) CGFloat                    fromValue;      // 开始值
@property (nonatomic, assign) CGFloat                    toValue;        // 结束值
@property (nonatomic, assign) CGFloat                    currentValue;   // 当前值
@property (nonatomic, assign) NSTimeInterval             duration;       // 持续时间

@property (nonatomic, strong) CAMediaTimingFunction     *timingFunction; // 时间函数
@property (nonatomic, strong) POPBasicAnimation         *conutAnimation;

/*
 *  存储值(执行动画之前，请先将设置的值进行存储)
 */
- (void)saveValues;

/*
 *  开始动画(继承的子类需要重写本方法来，然后与代理一起配合使用)
 */
- (void)startAnimation;

/*
 *  停止动画
 */
- (void)stopAnimation;

@end
