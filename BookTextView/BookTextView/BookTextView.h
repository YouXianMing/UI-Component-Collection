//
//  BookTextView.h
//  InTheQuietNight
//
//  Created by YouXianMing on 15/5/18.
//  Copyright (c) 2015年 XianMingYou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ExclusionView.h"
#import "ConfigAttributedString.h"

@interface BookTextView : UIView

// 要显示的文本
@property (nonatomic, strong)   NSString       *textString;

// 段落样式的设置
@property (nonatomic, strong)   NSDictionary   *paragraphAttributes;

// 富文本参数数组(ConfigAttributedString对象的数组)
@property (nonatomic, strong)   NSArray        *attributes;

// 计算出的文本的高度
@property (nonatomic, readonly) CGFloat         textHeight;

// 当前文本已读百分比
@property (nonatomic, readonly) CGFloat         currentPercent;

// 存储的图文混排的views
@property (nonatomic, strong)   NSArray        *exclusionViews;

/**
 *  构建出组件(设置完所有参数后再做)
 */
- (void)buildWidgetView;

/**
 *  移动到指定的位置(此方法只有延时执行才有效果,比如延时执行0.01s)
 *
 *  @param position 文本的高度位置
 */
- (void)moveToTextPosition:(CGFloat)position;

/**
 *  移动到指定的百分比(此方法只有延时执行才有效果,比如延时执行0.01s)
 *
 *  @param percent 百分比
 */
- (void)moveToTextPercent:(CGFloat)percent;

@end
