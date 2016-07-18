//
//  PlaceholderTextView+ConvenientSetup.m
//  PlaceholderTextView
//
//  Created by YouXianMing on 16/7/18.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

#import "PlaceholderTextView+ConvenientSetup.h"

@implementation PlaceholderTextView (ConvenientSetup)

- (void)placeholderString:(NSString *)string font:(UIFont *)font color:(UIColor *)color leftEdge:(CGFloat)leftEdge topEdge:(CGFloat)topEdge {
    
    NSParameterAssert(string);
    NSParameterAssert(font);
    NSParameterAssert(color);
    
    NSString                  *placeHorderString = string;
    NSMutableAttributedString *attributeString   = [[NSMutableAttributedString alloc] initWithString:placeHorderString];
    [attributeString addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, placeHorderString.length)];
    [attributeString addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange(0, placeHorderString.length)];
    
    self.placeHorderLeftEdge   = leftEdge;
    self.placeHorderTopEdge    = topEdge;
    self.attributedPlaceholder = attributeString;
}

- (void)textViewFont:(UIFont *)font color:(UIColor *)color containerInset:(UIEdgeInsets)containerInset {

    self.textView.font      = font;
    self.textView.textColor = color;
    self.textContainerInset = containerInset;
}

- (UIView *)createInputAccessoryViewWithViewHeight:(CGFloat)height {

    UIView *inputAccessoryView         = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, height)];
    inputAccessoryView.backgroundColor = [UIColor clearColor];
    self.textView.inputAccessoryView   = inputAccessoryView;
    
    return inputAccessoryView;
}

@end
