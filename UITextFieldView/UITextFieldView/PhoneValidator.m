//
//  PhoneValidator.m
//  UITextFieldView
//
//  Created by YouXianMing on 16/8/2.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

#import "PhoneValidator.h"

@implementation PhoneValidator

- (TextFieldValidatorMessage *)validatorWithInputSting:(NSString *)inputString {
    
    if (inputString.length != 11) {
        
        return textFieldValidatorMessageIsValid(NO, @"手机号码输入位数不对,请重新输入!");
        
    } else {
        
        return textFieldValidatorMessageIsValid(YES, nil);
    }
}

@end
