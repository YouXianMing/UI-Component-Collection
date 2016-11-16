//
//  ParagraphString.m
//  RichString
//
//  Created by YouXianMing on 2016/11/11.
//  Copyright © 2016年 TechCode. All rights reserved.
//

#import "ParagraphString.h"

@interface ParagraphString ()

@property (nonatomic, strong) NSMutableAttributedString *attributedString;

@end

@implementation ParagraphString

- (void)makeConfigEffective {
    
    if (self.string) {
        
        NSRange range = NSMakeRange(0, self.string.length);
        
        NSMutableAttributedString *richString = [[NSMutableAttributedString alloc] initWithString:self.string];
        
        self.font           ? [richString addAttribute:NSFontAttributeName            value:self.font range:range]           : 0;
        self.textColor      ? [richString addAttribute:NSForegroundColorAttributeName value:self.textColor range:range]      : 0;
        self.paragraphStyle ? [richString addAttribute:NSParagraphStyleAttributeName  value:self.paragraphStyle range:range] : 0;
        
        self.attributedString = richString;
        
    } else {
        
        self.attributedString = nil;
    }
}

+ (instancetype)paragraphStringWithString:(NSString *)string font:(UIFont *)font color:(UIColor *)color
                           paragraphStyle:(BaseParagraphStyle *)style {
    
    ParagraphString *paragraphString = [[[self class] alloc] init];
    paragraphString.string           = string;
    paragraphString.font             = font;
    paragraphString.textColor        = color;
    paragraphString.paragraphStyle   = style;
    [paragraphString makeConfigEffective];
    
    return paragraphString;
}

- (CGFloat)heightWithFixedWidth:(CGFloat)width {
    
    CGFloat height = 0;
    
    if (self.attributedString) {
        
        CGRect rect = [self.attributedString boundingRectWithSize:CGSizeMake(width, MAXFLOAT)
                                                          options:NSStringDrawingTruncatesLastVisibleLine |NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                                          context:nil];
        
        height = rect.size.height;
    }
    
    return height;
}

- (CGFloat)numberOfLines:(NSInteger)lines fixedWidth:(CGFloat)width {
    
    NSRange                    range      = NSMakeRange(0, self.string.length);
    NSMutableAttributedString *richString = [[NSMutableAttributedString alloc] initWithString:self.string];
    
    self.font           ? [richString addAttribute:NSFontAttributeName            value:self.font range:range]           : 0;
    self.textColor      ? [richString addAttribute:NSForegroundColorAttributeName value:self.textColor range:range]      : 0;
    self.paragraphStyle ? [richString addAttribute:NSParagraphStyleAttributeName  value:self.paragraphStyle range:range] : 0;
    
    UILabel *label       = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, 0)];
    label.numberOfLines  = lines;
    label.attributedText = richString;
    [label sizeToFit];
    
    return label.frame.size.height;
}

@end
