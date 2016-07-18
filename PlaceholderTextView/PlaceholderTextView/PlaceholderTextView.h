//
//  PlaceholderTextView.h
//  PlaceholderTextView
//
//  Created by YouXianMing on 16/7/18.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PlaceholderTextView;

@protocol PlaceholderTextViewDelegate <NSObject>

@optional

/**
 *  Asks the delegate if editing should begin in the specified text view.
 *
 *  @param textView PlaceholderTextView's object.
 *
 *  @return YEStrue if an editing session should be initiated; otherwise, NOfalse to disallow editing.
 */
- (BOOL)placeholderTextViewShouldBeginEditing:(PlaceholderTextView *)textView;

/**
 *  Asks the delegate if editing should stop in the specified text view.
 *
 *  @param textView PlaceholderTextView's object.
 *
 *  @return YEStrue if editing should stop; otherwise, NOfalse if the editing session should continue
 */
- (BOOL)placeholderTextViewShouldEndEditing:(PlaceholderTextView *)textView;

/**
 *  Tells the delegate that editing of the specified text view has begun.
 *
 *  @param textView PlaceholderTextView's object.
 */
- (void)placeholderTextViewDidBeginEditing:(PlaceholderTextView *)textView;

/**
 *  Tells the delegate that editing of the specified text view has ended.
 *
 *  @param textView PlaceholderTextView's object.
 */
- (void)placeholderTextViewDidEndEditing:(PlaceholderTextView *)textView;

/**
 *  Asks the delegate whether the specified text should be replaced in the text view.
 *
 *  @param textView PlaceholderTextView's object.
 *
 *  @return YEStrue if the old text should be replaced by the new text; NOfalse if the replacement operation should be aborted.
 */
- (BOOL)placeholderTextShouldChangeText:(PlaceholderTextView *)textView;

@end

@interface PlaceholderTextView : UIView

/**
 *  PlaceholderTextView's delegate.
 */
@property (nonatomic, weak) id <PlaceholderTextViewDelegate> delegate;

/**
 *  Current string.
 */
@property (nonatomic, strong, readonly) NSString *currentString;

#pragma mark - UITextView related.

/**
 *  The TextView.
 */
@property (nonatomic, strong, readonly) UITextView   *textView;

/**
 *  The textView's containerInset.
 */
@property (nonatomic) UIEdgeInsets  textContainerInset;

#pragma mark - Placeholder related.

/**
 *  Placeholder attributed string.
 */
@property (nonatomic, strong) NSAttributedString *attributedPlaceholder;

/**
 *  PlaceHorderString gap from left.
 */
@property (nonatomic) CGFloat placeHorderLeftEdge;

/**
 *  PlaceHorderString gap from top.
 */
@property (nonatomic) CGFloat placeHorderTopEdge;

#pragma mark - PlaceholderTextView's event.

/**
 * PlaceholderTextView resign first responder.
 */
- (void)placeholderTextViewResignFirstResponder;

/**
 *  PlaceholderTextView become first responder.
 */
- (void)placeholderTextViewbecomeFirstResponder;

@end





