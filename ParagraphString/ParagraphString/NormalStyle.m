//
//  NormalStyle.m
//  ParagraphString
//
//  Created by YouXianMing on 2016/11/16.
//  Copyright © 2016年 TechCode. All rights reserved.
//

#import "NormalStyle.h"

@implementation NormalStyle

- (instancetype)init {
    
    if (self = [super init]) {
        
        self.paragraphSpacing = 15.f;
        self.lineSpacing      = 5.f;
    }
    
    return self;
}

@end
