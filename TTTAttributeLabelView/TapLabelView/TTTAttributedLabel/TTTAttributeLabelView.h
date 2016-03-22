//
//  TTTAttributeLabelView.h
//  TappedLabel
//
//  Created by YouXianMing on 15/6/13.
//  Copyright (c) 2015年 YouXianMing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <CoreText/CoreText.h>
@class TTTAttributeLabelView;

@protocol TTTAttributeLabelViewDelegate <NSObject>
@optional
/**
 *  获取超链接点击事件
 *
 *  @param attributeLabelView 实例对象
 *  @param flag               设置的被点击的flag
 */
- (void)TTTAttributeLabelView:(TTTAttributeLabelView *)attributeLabelView linkFlag:(NSString *)flag;

@end

@interface TTTAttributeLabelView : UIView

/**
 *  代理
 */
@property (nonatomic, weak)   id <TTTAttributeLabelViewDelegate> delegate;

/**
 *  输入的富文本
 */
@property (nonatomic, strong) NSAttributedString   *attributedString;

/**
 *  通常状态链接颜色 + 通常状态链接下划线样式 + 点击链接时链接颜色 + 点击链接时下划线样式
 */
@property (nonatomic, strong) UIColor           *linkColor;
@property (nonatomic)         CTUnderlineStyle   linkUnderLineStyle;        // 默认值为kCTUnderlineStyleNone
@property (nonatomic, strong) UIColor           *activeLinkColor;
@property (nonatomic)         CTUnderlineStyle   activelinkUnderLineStyle;  // 默认值为kCTUnderlineStyleNone

/**
 *  添加超链接文本的文本range
 *
 *  @param linkStringRange 超链接文本的文本range
 *  @param flag            该文本的标记
 */
- (void)addLinkStringRange:(NSRange)linkStringRange flag:(NSString *)flag;

/**
 *  重置
 */
- (void)reset;

/**
 *  渲染文本
 */
- (void)render;

/**
 *  重新计算尺寸
 */
- (void)resetSize;

/**
 *  计算执行resetSize后的size
 *
 *  @param attributedString 富文本
 *  @param width            给定一个宽度
 *
 *  @return 计算好的size
 */
+ (CGSize)sizeThatFitsAttributedString:(NSAttributedString *)attributedString withFixedWidth:(CGFloat)width;

@end
