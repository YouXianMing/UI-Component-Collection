//
//  ParagraphAttributes+Constructor.m
//  BookTextView
//
//  Created by YouXianMing on 15/5/18.
//  Copyright (c) 2015年 YouXianMing. All rights reserved.
//

#import "ParagraphAttributes+Constructor.h"

@implementation ParagraphAttributes (Constructor)

+ (NSDictionary *)qingKeBengYue {
    ParagraphAttributes *config = [ParagraphAttributes new];
    
    config.textColor                   = READ_WORD_COLOR;
    config.textFont                    = [UIFont fontWithName:QingKeBengYue size:16.f];
    config.lineSpacing                 = @(10.f);
    config.paragraphSpacing            = @(40.f);
    config.firstLineHeadIndent         = @(0.f);
    
    return [config createAttributes];
}

@end
