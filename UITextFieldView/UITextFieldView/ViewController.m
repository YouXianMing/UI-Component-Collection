//
//  ViewController.m
//  UITextFieldView
//
//  Created by YouXianMing on 16/7/23.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

#import "ViewController.h"
#import "UITextFieldView.h"
#import "UIView+SetRect.h"
#import "TouchEventView.h"

@interface ViewController ()

@property (nonatomic, strong) UIScrollView *scrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    __weak typeof(self) wSelf = self;
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.scrollView];
    
    // 电话号码
    {
        CGRect frame = CGRectMake(10, 300, Width - 20, 40);
        [TouchEventView touchEventViewWithFrame:frame block:^(TouchEventView *touchEventView, ETouchEventViewEventType eventType) {
            
            if (eventType == kTouchEventViewAddSubViews) {
                
                [wSelf.scrollView addSubview:touchEventView];
                
                UITextFieldView *fieldView       = [[UITextFieldView alloc] initWithFrame:touchEventView.bounds];
                fieldView.textField.placeholder  = @"电话号码";
                [touchEventView.contentView addSubview:fieldView];
                
                [fieldView registerShouldChangeCharactersInRange:nil didBeginEditing:^(UITextFieldView *textFieldView) {
                    
                    [UIView animateWithDuration:0.35f animations:^{
                        
                        CGRect rect = [textFieldView rectFromView:self.scrollView];
                        wSelf.scrollView.contentOffset = CGPointMake(0, rect.origin.y - 200);
                    }];
                    
                } didEndEditing:^(UITextFieldView *textFieldView) {
                    
                    [UIView animateWithDuration:0.35f animations:^{
                        
                        wSelf.scrollView.contentOffset = CGPointMake(0, 0);
                    }];
                    
                } shouldReturn:^BOOL(UITextFieldView *textFieldView) {
                    
                    [textFieldView resignFirstResponder];
                    return YES;
                }];
            }
        }];
    }
    
    // 密码
    {
        CGRect frame = CGRectMake(10, 360, Width - 20, 40);
        [TouchEventView touchEventViewWithFrame:frame block:^(TouchEventView *touchEventView, ETouchEventViewEventType eventType) {
            
            if (eventType == kTouchEventViewAddSubViews) {
                
                [wSelf.scrollView addSubview:touchEventView];
                UITextFieldView *fieldView          = [[UITextFieldView alloc] initWithFrame:touchEventView.bounds];
                fieldView.textField.placeholder     = @"密码";
                fieldView.textField.secureTextEntry = YES;
                [touchEventView.contentView addSubview:fieldView];
                
                [fieldView registerShouldChangeCharactersInRange:nil didBeginEditing:^(UITextFieldView *textFieldView) {
                    
                    [UIView animateWithDuration:0.35f animations:^{
                        
                        CGRect rect = [textFieldView rectFromView:self.scrollView];
                        wSelf.scrollView.contentOffset = CGPointMake(0, rect.origin.y - 200);
                    }];
                    
                } didEndEditing:^(UITextFieldView *textFieldView) {
                    
                    [UIView animateWithDuration:0.35f animations:^{
                        
                        wSelf.scrollView.contentOffset = CGPointMake(0, 0);
                    }];
                    
                } shouldReturn:^BOOL(UITextFieldView *textFieldView) {
                    
                    [textFieldView resignFirstResponder];
                    return YES;
                }];
            }
        }];
    }
}

@end
