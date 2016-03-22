//
//  POPNumberCount.m
//  POP
//
//  Created by XianMingYou on 15/4/10.
//  Copyright (c) 2015年 XianMingYou. All rights reserved.
//

#import "POPNumberCount.h"
#import "ConfigAttributedString.h"

@implementation POPNumberCount

- (instancetype)init {
    self = [super init];
    if (self) {
        self.conutAnimation = [POPBasicAnimation animation];
    }
    return self;
}

- (void)saveValues {
    self.conutAnimation.fromValue = @(self.fromValue);
    self.conutAnimation.toValue   = @(self.toValue);
    self.conutAnimation.duration  = (self.duration <= 0 ? 0.4f : self.duration);
    if (self.timingFunction) {
        self.conutAnimation.timingFunction = self.timingFunction;
    }
}

- (void)startAnimation {
    // 只有执行了代理才会执行计数引擎
    if (self.delegate && [self.delegate respondsToSelector:@selector(numberCount:currentNumber:)]) {
        /* 将计算出来的值通过writeBlock动态给控件设定 */
        self.conutAnimation.property = \
        [POPMutableAnimatableProperty propertyWithName:@"conutAnimation"
                                           initializer:^(POPMutableAnimatableProperty *prop) {
                                               prop.writeBlock      = ^(id obj, const CGFloat values[]) {
                                                   NSNumber *number = @(values[0]);
                                                   _currentValue    = values[0];
                                                   
                                                   /* ------------- 子类重写父类的这个方法 ------------- */
                                                   [_delegate numberCount:self currentNumber:number];
                                                   /* ---------------------------------------------- */
                                               };
                                           }];
        
        // 添加动画
        [self pop_addAnimation:self.conutAnimation forKey:nil];
    }
}

- (void)stopAnimation {
    [self pop_removeAllAnimations];
}

@end
