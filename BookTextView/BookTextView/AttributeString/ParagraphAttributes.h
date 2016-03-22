//
//  ParagraphAttributes.h
//  BookTextView
//
//  Created by YouXianMing on 15/5/18.
//  Copyright (c) 2015年 YouXianMing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ParagraphAttributes : NSObject

@property (nonatomic, strong) UIColor  *textColor;
@property (nonatomic, strong) UIFont   *textFont;
@property (nonatomic, assign) CGFloat   kern;                // 字间距

@property (nonatomic, strong) NSNumber *lineSpacing;         // 段落样式 - 行间距
@property (nonatomic, strong) NSNumber *paragraphSpacing;    // 段落样式 - 段间距
@property (nonatomic, strong) NSNumber *firstLineHeadIndent; // 段落样式 - 段首文字缩进

- (NSDictionary *)createAttributes;

@end
