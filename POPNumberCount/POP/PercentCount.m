//
//  PercentCount.m
//  POP
//
//  Created by XianMingYou on 15/4/10.
//  Copyright (c) 2015年 XianMingYou. All rights reserved.
//

#import "PercentCount.h"
#import "ConfigAttributedString.h"
#import "NSString+RichText.h"

@implementation PercentCount

- (void)startAnimation {
    // 只有执行了代理才会执行计数引擎
    if (self.delegate && [self.delegate respondsToSelector:@selector(numberCount:currentAttributedString:)]) {
        /* 将计算出来的值通过writeBlock动态给控件设定 */
        self.conutAnimation.property = \
        [POPMutableAnimatableProperty propertyWithName:@"conutAnimation"
                                           initializer:^(POPMutableAnimatableProperty *prop) {
                                               prop.writeBlock      = ^(id obj, const CGFloat values[]) {
                                                   NSNumber *number = @(values[0]);
                                                   self.currentValue = values[0];

                                                   // 处理富文本
                                                   [self.delegate numberCount:self
                                                      currentAttributedString:[self accessNSNumber:number]];
                                               };
                                           }];
        
        // 添加动画
        [self pop_addAnimation:self.conutAnimation forKey:nil];
    }
}

- (NSAttributedString *)accessNSNumber:(NSNumber *)number {
    CGFloat count    = [number floatValue];
    
    UIColor *color   = [UIColor colorWithRed:count / 100.f green:0.f blue:0.f alpha:1.f];
    
    
    NSString *countStr = [NSString stringWithFormat:@"%.f", count];
    NSString *totalStr = [NSString stringWithFormat:@"%@ mps", countStr];
    
    UIFont *font1       = [UIFont fontWithName:@"AppleSDGothicNeo-Thin" size:50.f];
    UIFont *font2       = [UIFont fontWithName:@"Avenir-MediumOblique" size:25.f];
    
    NSRange totalRange   = [totalStr range];              // 全局的区域
    NSRange countRange   = [countStr rangeFrom:totalStr]; // %的区域
    
    return [totalStr createAttributedStringAndConfig:@[
                                                       // 全局设置
                                                       [ConfigAttributedString font:font2
                                                                              range:totalRange],
                                                       [ConfigAttributedString font:font1
                                                                              range:countRange],
                                                       [ConfigAttributedString foregroundColor:[UIColor grayColor]
                                                                                         range:totalRange],
                                                       
                                                       
                                                       // 局部设置
                                                       [ConfigAttributedString foregroundColor:color
                                                                                         range:countRange],
                                                       
                                                       ]];
}


@end
