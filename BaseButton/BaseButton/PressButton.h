//
//  PressButton.h
//  BaseButton
//
//  Created by YouXianMing on 15/8/27.
//  Copyright (c) 2015年 YouXianMing. All rights reserved.
//

#import "BaseControl.h"
@class PressButton;

@protocol PressButtonDelegate <NSObject>

@required
- (void)pressButtonEvent:(PressButton *)pressButton;

@end

@interface PressButton : BaseControl

@property (nonatomic, weak) id <PressButtonDelegate>  delegate;

@end
