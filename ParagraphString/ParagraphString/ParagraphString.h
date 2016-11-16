//
//  ParagraphString.h
//  RichString
//
//  Created by YouXianMing on 2016/11/11.
//  Copyright © 2016年 TechCode. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "BaseParagraphStyle.h"

@interface ParagraphString : NSObject

/**
 The input string.
 */
@property (nonatomic, strong) NSString            *string;

/**
 Set the string's font, default is nil.
 */
@property (nonatomic, strong) UIFont              *font;

/**
 Set the string's textColor, default is nil.
 */
@property (nonatomic, strong) UIColor             *textColor;

/**
 Set the paragraph style, default is nil.
 */
@property (nonatomic, strong) BaseParagraphStyle  *paragraphStyle;

/**
 Make the config (Font, textColor, paragraphStyle) effective.
 */
- (void)makeConfigEffective;

/**
 The attributedString, before you get this, you should set property and run makeConfigEffective first.
 */
@property (nonatomic, strong, readonly) NSMutableAttributedString *attributedString;

/**
 The string's height with the fixed width.

 @param width The specified width.
 @return The string's height.
 */
- (CGFloat)heightWithFixedWidth:(CGFloat)width;

/**
 The string's height with the fixed width.

 @param lines The number of lines.
 @param width The specified width.
 @return The string's height.
 */
- (CGFloat)numberOfLines:(NSInteger)lines fixedWidth:(CGFloat)width;

/**
 ParagraphString's constructor.

 @param string The string.
 @param font The font.
 @param color The color.
 @param style The paragraph style.
 @return The ParagraphString's instance.
 */
+ (instancetype)paragraphStringWithString:(NSString *)string font:(UIFont *)font color:(UIColor *)color
                           paragraphStyle:(BaseParagraphStyle *)style;

@end
