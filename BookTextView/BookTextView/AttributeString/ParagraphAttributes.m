//
//  ParagraphAttributes.m
//  BookTextView
//
//  Created by YouXianMing on 15/5/18.
//  Copyright (c) 2015年 YouXianMing. All rights reserved.
//

#import "ParagraphAttributes.h"


@implementation ParagraphAttributes

- (NSDictionary *)createAttributes {
    // 初始化字典
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    
    // 设置颜色
    [dic setValue:(self.textColor == nil ? [UIColor blackColor] : self.textColor)
           forKey:NSForegroundColorAttributeName];
    
    // 设置字体
    [dic setValue:(self.textFont == nil ? [UIFont systemFontOfSize:18.f] : self.textFont)
           forKey:NSFontAttributeName];
    
    // 段落样式
    NSMutableParagraphStyle *style = [NSMutableParagraphStyle new];
    {
        style.lineSpacing         = (self.lineSpacing         == nil ? 5.f : self.lineSpacing.floatValue);
        style.paragraphSpacing    = (self.paragraphSpacing    == nil ? 5.f : self.paragraphSpacing.floatValue);
        style.firstLineHeadIndent = (self.firstLineHeadIndent == nil ? 18 * 2 : self.firstLineHeadIndent.floatValue);
    }
    [dic setValue:style
           forKey:NSParagraphStyleAttributeName];
    
    // 字间距
    [dic setValue:(self.kern <= 0 ? @(0) : @(self.kern))
           forKey:NSKernAttributeName];
    
    return dic;
}

@end
