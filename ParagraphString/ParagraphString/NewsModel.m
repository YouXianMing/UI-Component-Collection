//
//  NewsModel.m
//  ParagraphString
//
//  Created by YouXianMing on 2016/11/14.
//  Copyright © 2016年 TechCode. All rights reserved.
//

#import "NewsModel.h"
#import "ParagraphString.h"
#import "NormalStyle.h"
#import "UIView+SetRect.h"

@interface NewsModel ()

@property (nonatomic, strong) NSMutableAttributedString  *attributedContent;
@property (nonatomic)         CGFloat                     contentHeight;

@end

@implementation NewsModel

+ (instancetype)newsModelWithTitle:(NSString *)title content:(NSString *)content {
    
    NewsModel *model = [[[self class] alloc] init];
    model.title      = title;
    model.content    = content;
    
    ParagraphString *string = [ParagraphString paragraphStringWithString:model.content font:[UIFont fontWithName:@"InputMono-ExtraLightItalic" size:12.f]
                                                                   color:[[UIColor blackColor] colorWithAlphaComponent:0.5f] paragraphStyle:[NormalStyle new]];
    model.attributedContent  = string.attributedString;
    model.contentHeight      = 50.f + [string heightWithFixedWidth:Width - 30.f] + 15.f;
    
    return model;
}

@end
