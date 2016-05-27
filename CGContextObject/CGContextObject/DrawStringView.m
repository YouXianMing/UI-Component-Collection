//
//  DrawStringView.m
//  CGContextObject
//
//  Created by YouXianMing on 15/11/16.
//  Copyright © 2015年 ZiPeiYi. All rights reserved.
//

#import "DrawStringView.h"
#import "CGContextObject.h"
#import "StringAttributeHelper.h"

@interface DrawStringView ()

@property (nonatomic, strong)  CGContextObject  *contextObject;

@end

@implementation DrawStringView

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor clearColor];
    }
    
    return self;
}

- (void)drawRect:(CGRect)rect {
    
    _contextObject = [[CGContextObject alloc] initWithCGContext:UIGraphicsGetCurrentContext()
                                                         config:[CGContextObjectConfig new]];
    
    // Draw NSAttributedString At Point(30, 10) & CGContextRotateCTM 45°
    {
        // 文本
        NSString *showString = @"Draw NSAttributedString At Point(30, 10) & CGContextRotateCTM 45°";
        
        // 全局设置
        FontAttribute *fullFont = [FontAttribute new];
        fullFont.font           = [UIFont fontWithName:@"AppleSDGothicNeo-UltraLight" size:10];
        fullFont.effectRange    = NSMakeRange(0, showString.length);
        
        ForegroundColorAttribute *fullColor = [ForegroundColorAttribute new];
        fullColor.color                     = [UIColor blackColor];
        fullColor.effectRange               = NSMakeRange(0, showString.length);
        
        // 局部设置
        FontAttribute *partFont = [FontAttribute new];
        partFont.font           = [UIFont fontWithName:@"AppleSDGothicNeo-UltraLight" size:14];
        partFont.effectRange    = NSMakeRange(0, 4);
        
        ForegroundColorAttribute *redColor = [ForegroundColorAttribute new];
        redColor.color                     = [UIColor redColor];
        redColor.effectRange               = NSMakeRange(0, 4);
        
        NSAttributedString *attributeString = [showString mutableAttributedStringWithStringAttributes:@[fullFont, partFont, fullColor, redColor]];
        
        [_contextObject drawInCurrentSpecialState:^(CGContextObject *contextObject) {
           
            CGContextRotateCTM(_contextObject.context, 45.f * M_PI / 180);
            [_contextObject drawAttributedString:attributeString atPoint:CGPointMake(30, 10)];
        }];
    }
    
    // Draw NSAttributedString At Rect(10, 120, 100, 100)
    {
        // 文本
        NSString *showString = @"Draw NSAttributedString At Rect(10, 120, 100, 100)";
        
        // 全局设置
        FontAttribute *fullFont = [FontAttribute new];
        fullFont.font           = [UIFont fontWithName:@"AppleSDGothicNeo-UltraLight" size:10];
        fullFont.effectRange    = NSMakeRange(0, showString.length);
        
        ForegroundColorAttribute *fullColor = [ForegroundColorAttribute new];
        fullColor.color                     = [UIColor blackColor];
        fullColor.effectRange               = NSMakeRange(0, showString.length);
        
        // 局部设置
        FontAttribute *partFont = [FontAttribute new];
        partFont.font           = [UIFont fontWithName:@"AppleSDGothicNeo-UltraLight" size:14];
        partFont.effectRange    = NSMakeRange(0, 4);
        
        ForegroundColorAttribute *redColor = [ForegroundColorAttribute new];
        redColor.color                     = [UIColor redColor];
        redColor.effectRange               = NSMakeRange(0, 4);
        
        NSAttributedString *attributeString = [showString mutableAttributedStringWithStringAttributes:@[fullFont, partFont, fullColor, redColor]];
        [_contextObject drawAttributedString:attributeString inRect:CGRectMake(10, 120, 100, 100)];
    }
}

@end
