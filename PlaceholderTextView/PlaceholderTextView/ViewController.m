//
//  ViewController.m
//  PlaceholderTextView
//
//  Created by YouXianMing on 16/7/18.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

#import "ViewController.h"
#import "PlaceholderTextView.h"
#import "PlaceholderTextView+ConvenientSetup.h"

@interface ViewController () <PlaceholderTextViewDelegate> {
    
    PlaceholderTextView *_textView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    UIColor *grayColor  = [UIColor grayColor];
    UIColor *textColor  = [[UIColor blackColor] colorWithAlphaComponent:0.95f];
    UIColor *whiteColor = [UIColor whiteColor];
    UIFont  *font_16    = [UIFont systemFontOfSize:16.f];
    
    // Add UITapGestureRecognizer.
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gestureEvent)];
    [self.view addGestureRecognizer:tapGesture];
    
    // Create PlaceholderTextView.
    _textView                   = [[PlaceholderTextView alloc] initWithFrame:CGRectMake(0, 20, 320, 180)];
    _textView.layer.borderWidth = 0.5f;
    _textView.delegate          = self;
    [self.view addSubview:_textView];
    
    // Set placeholderString.
    [_textView placeholderString:@"请输入您的评价(少于50字)" font:font_16 color:grayColor leftEdge:19.f topEdge:15.f];
    
    // Set textView.
    [_textView textViewFont:font_16 color:textColor containerInset:UIEdgeInsetsMake(15.f, 15.f, 15.f, 15.f)];
    
    // Create inputAccessoryView.
    UIView *inputAccessoryView         = [_textView createInputAccessoryViewWithViewHeight:40.f];
    inputAccessoryView.backgroundColor = grayColor;
    
    // Setup inputAccessoryView.
    UIButton *button       = [[UIButton alloc] initWithFrame:inputAccessoryView.bounds];
    button.titleLabel.font = [UIFont systemFontOfSize:14.f];
    [button setTitle:@"确定" forState:UIControlStateNormal];
    [button setTitleColor:whiteColor forState:UIControlStateNormal];
    [button setTitleColor:[whiteColor colorWithAlphaComponent:0.5f] forState:UIControlStateHighlighted];
    [button addTarget:self action:@selector(inputAccessoryViewEvent) forControlEvents:UIControlEventTouchUpInside];
    [inputAccessoryView addSubview:button];
}

#pragma mark - Event related.

- (void)inputAccessoryViewEvent {
    
    [_textView placeholderTextViewResignFirstResponder];
}

- (void)gestureEvent {

    [self.view endEditing:YES];
}

#pragma mark - PlaceholderTextViewDelegate

- (BOOL)placeholderTextShouldChangeText:(PlaceholderTextView *)textView {
    
    NSLog(@"--> %@", textView.currentString);
    BOOL result; textView.currentString.length >= 50 ? (result = NO) : (result = YES);
    return result;
}

- (BOOL)placeholderTextViewShouldBeginEditing:(PlaceholderTextView *)textView {
    
    NSLog(@"placeholderTextViewShouldBeginEditing");
    return YES;
}

- (BOOL)placeholderTextViewShouldEndEditing:(PlaceholderTextView *)textView {
    
    NSLog(@"placeholderTextViewShouldEndEditing");
    return YES;
}

- (void)placeholderTextViewDidBeginEditing:(PlaceholderTextView *)textView {
    
    NSLog(@"placeholderTextViewDidBeginEditing");
}

- (void)placeholderTextViewDidEndEditing:(PlaceholderTextView *)textView {
    
    NSLog(@"placeholderTextViewDidEndEditing");
}

#pragma mark - System method.

- (void)viewDidAppear:(BOOL)animated {

    [super viewDidAppear:animated];
    [_textView placeholderTextViewbecomeFirstResponder];
}

@end
