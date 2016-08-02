//
//  PasswordValidator.m
//  UITextFieldView
//
//  Created by YouXianMing on 16/8/2.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

#import "PasswordValidator.h"

@implementation PasswordValidator

- (TextFieldValidatorMessage *)validatorWithInputSting:(NSString *)inputString {

    if (inputString.length <= 6) {
        
        return textFieldValidatorMessageIsValid(NO, @"密码长度少于6位,请重新输入");
        
    } else if (inputString.length > 10) {
    
        return textFieldValidatorMessageIsValid(NO, @"密码长度大于10位,请重新输入");
        
    } else {
    
        return textFieldValidatorMessageIsValid(YES, nil);
    }
}

@end
