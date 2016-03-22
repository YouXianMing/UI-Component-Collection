//
//  BaseControl.h
//  BaseButton
//
//  Created by YouXianMing on 15/8/27.
//  Copyright (c) 2015年 YouXianMing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseControl : UIView

/**
 *  ========================
 *  = override by subclass =
 *  ========================
 *
 *  触发点击事件
 */
- (void)touchEvent;

/**
 *  ========================
 *  = override by subclass =
 *  ========================
 *
 *  拖拽到rect外面触发的事件
 */
- (void)touchDragExit;

/**
 *  ========================
 *  = override by subclass =
 *  ========================
 *
 *  点击事件开始
 */
- (void)touchBegin;

@end
