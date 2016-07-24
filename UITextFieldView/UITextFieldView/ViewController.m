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

@interface ViewController ()

@property (nonatomic, strong) UIScrollView *scrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.scrollView];
    
    {
        UITextFieldView *fieldView       = [[UITextFieldView alloc] initWithFrame:CGRectMake(10, 300, Width - 20, 40)];
        fieldView.textField.placeholder  = @"电话号码";
        [self.scrollView addSubview:fieldView];
        
        [fieldView registerShouldChangeCharactersInRange:nil didBeginEditing:^(UITextFieldView *textFieldView) {
            
            [UIView animateWithDuration:0.35f animations:^{
                
                CGRect rect = [textFieldView rectFromView:self.scrollView];
                self.scrollView.contentOffset = CGPointMake(0, rect.origin.y - 200);
            }];
            
        } didEndEditing:^(UITextFieldView *textFieldView) {
            
            [UIView animateWithDuration:0.35f animations:^{
                
                self.scrollView.contentOffset = CGPointMake(0, 0);
            }];
            
        } shouldReturn:^BOOL(UITextFieldView *textFieldView) {
            
            [textFieldView resignFirstResponder];
            return YES;
        }];
    }
    
    {
        UITextFieldView *fieldView          = [[UITextFieldView alloc] initWithFrame:CGRectMake(10, 360, Width - 20, 40)];
        fieldView.textField.placeholder     = @"密码";
        fieldView.textField.secureTextEntry = YES;
        [self.scrollView addSubview:fieldView];
        
        [fieldView registerShouldChangeCharactersInRange:nil didBeginEditing:^(UITextFieldView *textFieldView) {
            
            [UIView animateWithDuration:0.35f animations:^{
                
                CGRect rect = [textFieldView rectFromView:self.scrollView];
                self.scrollView.contentOffset = CGPointMake(0, rect.origin.y - 200);
            }];
            
        } didEndEditing:^(UITextFieldView *textFieldView) {
            
            [UIView animateWithDuration:0.35f animations:^{
                
                self.scrollView.contentOffset = CGPointMake(0, 0);
            }];
            
        } shouldReturn:^BOOL(UITextFieldView *textFieldView) {
            
            [textFieldView resignFirstResponder];
            return YES;
        }];
    }
}

@end
