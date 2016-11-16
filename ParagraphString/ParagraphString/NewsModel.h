//
//  NewsModel.h
//  ParagraphString
//
//  Created by YouXianMing on 2016/11/14.
//  Copyright © 2016年 TechCode. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NewsModel : NSObject

@property (nonatomic, strong) NSString  *title;
@property (nonatomic, strong) NSString  *content;

+ (instancetype)newsModelWithTitle:(NSString *)title content:(NSString *)content;

@property (nonatomic, strong, readonly) NSMutableAttributedString  *attributedContent;
@property (nonatomic, readonly)         CGFloat                     contentHeight;

@end
