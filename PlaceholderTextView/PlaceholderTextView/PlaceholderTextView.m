//
//  PlaceholderTextView.m
//  PlaceholderTextView
//
//  Created by YouXianMing on 16/7/18.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

#import "PlaceholderTextView.h"

@interface PlaceholderTextView () <UITextViewDelegate>

@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) UITextView  *textView;
@property (nonatomic, strong) NSString    *currentString;

@end

@implementation PlaceholderTextView

#pragma mark - Frame related method.

- (void)layoutSubviews {

    [super layoutSubviews];
    
    self.textView.frame = self.bounds;
    [self resetPlaceHorderFrame];
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        self.textField             = [[UITextField alloc] init];
        self.textField.enabled     = NO;
        self.textField.textColor   = [UIColor clearColor];
        [self addSubview:self.textField];
        
        self.textView                 = [[UITextView alloc] initWithFrame:self.bounds];
        self.textView.delegate        = self;
        self.textView.backgroundColor = [UIColor clearColor];
        self.textView.textColor       = [UIColor grayColor];
        [self addSubview:self.textView];
    }
    
    return self;
}

#pragma mark - FirstResponder related.

- (void)placeholderTextViewResignFirstResponder {

    [self.textView resignFirstResponder];
}

- (void)placeholderTextViewbecomeFirstResponder {

    [self.textView becomeFirstResponder];
}

#pragma mark - UITextViewDelegate

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    
    NSString *currentText = [textView.text stringByReplacingCharactersInRange:range withString:text];
    self.textField.text   = currentText;
    self.currentString    = currentText;
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(placeholderTextShouldChangeText:)]) {
        
        return [self.delegate placeholderTextShouldChangeText:self];
        
    } else {
    
        return YES;
    }
}

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView {

    if (self.delegate && [self.delegate respondsToSelector:@selector(placeholderTextViewShouldBeginEditing:)]) {
        
        return [self.delegate placeholderTextViewShouldBeginEditing:self];
        
    } else {
    
        return YES;
    }
}

- (BOOL)textViewShouldEndEditing:(UITextView *)textView {

    if (self.delegate && [self.delegate respondsToSelector:@selector(placeholderTextViewShouldEndEditing:)]) {
        
        return [self.delegate placeholderTextViewShouldEndEditing:self];
        
    } else {
    
        return YES;
    }
}

- (void)textViewDidBeginEditing:(UITextView *)textView {

    if (self.delegate && [self.delegate respondsToSelector:@selector(placeholderTextViewDidBeginEditing:)]) {
        
        [self.delegate placeholderTextViewDidBeginEditing:self];
    }
}

- (void)textViewDidEndEditing:(UITextView *)textView {

    if (self.delegate && [self.delegate respondsToSelector:@selector(placeholderTextViewDidEndEditing:)]) {
        
        [self.delegate placeholderTextViewDidEndEditing:self];
    }
}

#pragma mark - PlaceHorder related

- (void)resetPlaceHorderFrame {

    self.textField.attributedPlaceholder = _attributedPlaceholder;
    [self.textField sizeToFit];
    
    CGRect newFrame      = self.textField.frame;
    newFrame.origin.x    = _placeHorderLeftEdge;
    newFrame.origin.y    = _placeHorderTopEdge;
    self.textField.frame = newFrame;
}

#pragma mark - Setter & Getter

- (void)setTextContainerInset:(UIEdgeInsets)textContainerInset {

    _textContainerInset          = textContainerInset;
    _textView.textContainerInset = textContainerInset;
}

- (void)setPlaceHorderLeftEdge:(CGFloat)placeHorderLeftEdge {

    _placeHorderLeftEdge = placeHorderLeftEdge;
    [self resetPlaceHorderFrame];
}

- (void)setPlaceHorderTopEdge:(CGFloat)placeHorderTopEdge {

    _placeHorderTopEdge = placeHorderTopEdge;
    [self resetPlaceHorderFrame];
}

- (void)setAttributedPlaceholder:(NSAttributedString *)attributedPlaceholder {

    _attributedPlaceholder = attributedPlaceholder;
    [self resetPlaceHorderFrame];
}

@end



