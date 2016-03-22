//
//  ParagraphAttributes+Constructor.h
//  BookTextView
//
//  Created by YouXianMing on 15/5/18.
//  Copyright (c) 2015年 YouXianMing. All rights reserved.
//

#import "ParagraphAttributes.h"

#define  READ_WORD_COLOR   [UIColor colorWithRed:0.600 green:0.490 blue:0.376 alpha:1]
#define  QingKeBengYue     @"FZQKBYSJW--GB1-0"

@interface ParagraphAttributes (Constructor)

// 便利构造器
+ (NSDictionary *)qingKeBengYue;

@end
