//
//  NormalAlertView.m
//  AlertViewDemo
//
//  Created by YouXianMing on 15/10/15.
//  Copyright © 2015年 ZiPeiYi. All rights reserved.
//

#import "NormalAlertView.h"

@interface NormalAlertView ()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *messageLabel;

@end

@implementation NormalAlertView

- (void)buildView {
    
    CGFloat buttonGap        = 10; // 按钮间隙宽度
    CGFloat titleLabelHeight = 40; // 标题高度
    CGFloat totalHeight      = 0;  // 累计高度
    
    // 固定的宽度
    self.width = Width - 100;
    
    self.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.5f];

    // 创建标题
    if (self.title.length) {
        
        self.titleLabel               = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.width, titleLabelHeight)];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.text          = self.title;
        self.titleLabel.textColor     = [UIColor whiteColor];
        self.titleLabel.font          = [UIFont fontWithName:@"AppleSDGothicNeo-Light" size:18.f];
        [self addSubview:self.titleLabel];
        
        totalHeight += titleLabelHeight;
    }
    
    // 创建消息
    if (self.message.length) {
        
        self.messageLabel               = [[UILabel alloc] initWithFrame:CGRectMake(4, titleLabelHeight, self.width - 8, 0)];
        self.messageLabel.textAlignment = NSTextAlignmentCenter;
        self.messageLabel.text          = self.message;
        self.messageLabel.textColor     = [UIColor whiteColor];
        self.messageLabel.numberOfLines = 0;
        self.messageLabel.font          = [UIFont fontWithName:@"AppleSDGothicNeo-Thin" size:16.f];
        [self.messageLabel sizeToFit];
        [self addSubview:self.messageLabel];
        
        totalHeight += self.messageLabel.height;
    }
    
    // 创建按钮 + 添加按钮事件
    if (self.buttonTitlesArray.count) {
        
        // 按钮宽度
        CGFloat buttonWidth = (self.width - (self.buttonTitlesArray.count + 1) * buttonGap) / self.buttonTitlesArray.count;
        
        // 创建按钮
        for (int i = 0; i < self.buttonTitlesArray.count; i++) {
            
            UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(buttonGap * (i + 1) + buttonWidth * i,
                                                                          titleLabelHeight + self.messageLabel.height + 10,
                                                                          buttonWidth,
                                                                          25)];
            button.tag = i;
            
            [button addTarget:self
                       action:@selector(buttonEvent:)
             forControlEvents:UIControlEventTouchUpInside];
            
            [button setTitle:self.buttonTitlesArray[i]
                    forState:UIControlStateNormal];
            
            button.titleLabel.font = [UIFont fontWithName:@"AppleSDGothicNeo-UltraLight" size:14.f];
            if (i == 0) {
            
                button.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.85f];
                
            } else {
            
                button.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.85f];
            }
            
            [self addSubview:button];
        }
        
        totalHeight += 25;
    }
    
    totalHeight += 20;
    
    self.height = totalHeight;
    
    [self doShowAnimation];
}

- (void)doShowAnimation {

    self.alpha = 0;
    self.scale = 1.5;
    
    [UIView animateWithDuration:1 delay:0.f usingSpringWithDamping:1 initialSpringVelocity:0 options:0 animations:^{
        
        self.alpha = 1.f;
        self.scale = 1.f;
        
    } completion:^(BOOL finished) {
        
    }];
}

- (void)doHideAnimation {
    
    [UIView animateWithDuration:1 delay:0.f usingSpringWithDamping:1 initialSpringVelocity:0 options:0 animations:^{
        
        self.alpha = 0.f;
        self.scale = 0.5f;
        
    } completion:^(BOOL finished) {
        
        [self removeFromSuperview];
    }];
}

- (void)buttonEvent:(UIButton *)button {

    if (self.delegate && [self.delegate respondsToSelector:@selector(alertView:buttonEventIndex:)]) {
        
        [self.delegate alertView:self buttonEventIndex:button.tag];
    }
}

- (void)show {

    [self buildView];
    
    [self.insertView addSubview:self];
    self.center = self.insertView.middlePoint;
}

- (void)hide {
    
    [self doHideAnimation];
}

@end
