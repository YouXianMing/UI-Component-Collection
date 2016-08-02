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
#import "AccessViewTagProtocol.h"
#import "PasswordValidator.h"
#import "PhoneValidator.h"
#import "UIAlertController+Constructor.h"

typedef enum : NSUInteger {
    
    kPhoneFieldView = 1000,
    kPasswordFieldView,
    kButton,
    
} EViewControllerViewTag;

@interface ViewController () <AccessViewTagProtocol, UITextFieldViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) NSMapTable <NSString *, UIView *> *viewsWeakMap;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.viewsWeakMap = [NSMapTable strongToWeakObjectsMapTable];
    
    __weak typeof(self) wSelf = self;
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.scrollView];
    
    // 电话号码
    {
        CGRect frame = CGRectMake(10, 300, Width - 20, 40);
        [TouchEventView touchEventViewWithFrame:frame block:^(TouchEventView *touchEventView, ETouchEventViewEventType eventType) {
            
            if (eventType == kTouchEventViewAddSubViews) {
                
                [wSelf.scrollView addSubview:touchEventView];
                
                // 创建 UITextFieldView
                UITextFieldView *fieldView       = [[UITextFieldView alloc] initWithFrame:touchEventView.bounds];
                fieldView.delegate               = wSelf;
                fieldView.textFieldViewValidator = [PhoneValidator new];
                fieldView.textField.placeholder  = @"电话号码";
                [touchEventView.contentView addSubview:fieldView];
                [wSelf setView:fieldView withTag:kPhoneFieldView];
                
                // UITextFieldView 相关事件
                [fieldView registerShouldChangeCharactersInRange:^BOOL(UITextFieldView *textFieldView, NSRange range, NSString *replacementString, NSString *currentText) {
                    
                    return YES;
                    
                } didBeginEditing:^(UITextFieldView *textFieldView) {
                    
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
                
                // 创建 InputAccessoryView
                [fieldView createInputAccessoryViewWithViewHeight:40.f block:^(UIView *inputAccessoryView, UITextFieldView *textFieldView) {
                    
                    UIButton *button         = [[UIButton alloc] initWithFrame:inputAccessoryView.bounds];
                    button.layer.borderWidth = 0.5f;
                    [button addTarget:textFieldView action:@selector(resignFirstResponder) forControlEvents:UIControlEventTouchUpInside];
                    [button setTitle:@"确定" forState:UIControlStateNormal];
                    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                    [button setTitleColor:[[UIColor blackColor] colorWithAlphaComponent:0.5f] forState:UIControlStateHighlighted];
                    
                    [inputAccessoryView addSubview:button];
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
                
                // 创建 UITextFieldView
                UITextFieldView *fieldView          = [[UITextFieldView alloc] initWithFrame:touchEventView.bounds];
                fieldView.delegate                  = wSelf;
                fieldView.textFieldViewValidator    = [PasswordValidator new];
                fieldView.textField.placeholder     = @"密码";
                fieldView.textField.secureTextEntry = YES;
                [touchEventView.contentView addSubview:fieldView];
                [wSelf setView:fieldView withTag:kPasswordFieldView];
                
                // UITextFieldView 相关事件
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
    
    UIButton *button         = [[UIButton alloc] initWithFrame:CGRectMake(0, 20, Width, 60.f)];
    button.layer.borderWidth = 0.5f;
    button.enabled           = NO;
    [self setView:button withTag:kButton];
    [button setTitle:@"开始验证" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitleColor:[[UIColor blackColor] colorWithAlphaComponent:0.5f] forState:UIControlStateHighlighted];
    [button setTitleColor:[[UIColor grayColor] colorWithAlphaComponent:0.5f] forState:UIControlStateDisabled];
    [button addTarget:self action:@selector(buttonEvent) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)buttonEvent {

    UITextFieldView *phoneField    = [self viewWithTag:kPhoneFieldView];
    UITextFieldView *passwordField = [self viewWithTag:kPasswordFieldView];
    
    // 验证手机
    if ([phoneField checkingTheTextFieldViewString].isValidString == NO) {
        
        [UIAlertController alertStyleShowInController:self
                                                title:nil
                                              message:[phoneField checkingTheTextFieldViewString].errorMessage
                                    alertActionsBlock:^(NSMutableArray<UIAlertAction *> *alertActions) {
                                    
                                        [alertActions addObject:defaultStyleAction(@"确定", nil)];
                                    }
                                           completion:nil];
        return;
    }
    
    // 验证密码
    if ([passwordField checkingTheTextFieldViewString].isValidString == NO) {
        
        [UIAlertController alertStyleShowInController:self
                                                title:nil
                                              message:[passwordField checkingTheTextFieldViewString].errorMessage
                                    alertActionsBlock:^(NSMutableArray<UIAlertAction *> *alertActions) {
                                        
                                        [alertActions addObject:defaultStyleAction(@"确定", nil)];
                                    }
                                           completion:nil];
        return;
    }
}

#pragma mark - UITextFieldViewDelegate

- (void)textFieldView:(UITextFieldView *)textFieldView currentString:(NSString *)currentString {

    UITextFieldView *phoneField    = [self viewWithTag:kPhoneFieldView];
    UITextFieldView *passwordField = [self viewWithTag:kPasswordFieldView];
    UIButton        *button        = [self viewWithTag:kButton];
    
    if (phoneField.currentText.length && passwordField.currentText.length) {
        
        button.enabled = YES;
        
    } else {
    
        button.enabled = NO;
    }
}

#pragma mark - AccessViewTagProtocol

- (void)setView:(UIView *)view withTag:(NSInteger)tag {
    
    [_viewsWeakMap setObject:view forKey:@(tag).stringValue];
}

- (id)viewWithTag:(NSInteger)tag {
    
    return [_viewsWeakMap objectForKey:@(tag).stringValue];
}

@end
