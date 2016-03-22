//
//  PercentCount.h
//  POP
//
//  Created by XianMingYou on 15/4/10.
//  Copyright (c) 2015年 XianMingYou. All rights reserved.
//

#import "POPNumberCount.h"

@interface PercentCount : POPNumberCount

/**
 *  重写父类方法
 *
 *  @param numberCount 对象自己
 *  @param number      变化的值
 */
- (void)startAnimation;

@end
