//
//  PlaceholderTextView+ConvenientSetup.h
//  PlaceholderTextView
//
//  Created by YouXianMing on 16/7/18.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

#import "PlaceholderTextView.h"

@interface PlaceholderTextView (ConvenientSetup)

/**
 *  PlaceholderTextView's placeholderString setup.
 *
 *  @param string   The placeholderString.
 *  @param font     Font.
 *  @param color    Color.
 *  @param leftEdge Gap from left.
 *  @param topEdge  Gap from top.
 */
- (void)placeholderString:(NSString *)string font:(UIFont *)font color:(UIColor *)color leftEdge:(CGFloat)leftEdge topEdge:(CGFloat)topEdge;

/**
 *  PlaceholderTextView's textView setup.
 *
 *  @param font           Font.
 *  @param color          Color.
 *  @param containerInset TextContainerInset.
 */
- (void)textViewFont:(UIFont *)font color:(UIColor *)color containerInset:(UIEdgeInsets)containerInset;

/**
 *  Create the InputAccessoryView with the specified heigh.
 *
 *  @param height The view's height.
 *
 *  @return InputAccessoryView.
 */
- (UIView *)createInputAccessoryViewWithViewHeight:(CGFloat)height;

@end
