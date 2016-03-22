//
//  TTTAttributeLabelView.m
//  TappedLabel
//
//  Created by YouXianMing on 15/6/13.
//  Copyright (c) 2015年 YouXianMing. All rights reserved.
//

#import "TTTAttributeLabelView.h"
#import "TTTAttributedLabel.h"

/**
 *  将CFString转换为NSString
 *
 *  @param cfString
 *
 *  @return 转换后的CFString
 */
static inline NSString*  nsStringWithCfString(CFStringRef cfString) {
    return (__bridge NSString *)cfString;
}

/*--------------------------------------------------------------------------------*/

@interface RangeFlag : NSObject

@property (nonatomic, strong) NSString *flag;
@property (nonatomic)         NSRange   range;

+ (RangeFlag *)rangeFlagWithFlag:(NSString *)flag range:(NSRange)range;

@end

@implementation RangeFlag

+ (RangeFlag *)rangeFlagWithFlag:(NSString *)flag range:(NSRange)range {
    RangeFlag *rangeFlag = [RangeFlag new];
    rangeFlag.flag       = flag;
    rangeFlag.range      = range;
    
    return rangeFlag;
}

@end


/*--------------------------------------------------------------------------------*/


@interface TTTAttributeLabelView () <TTTAttributedLabelDelegate>

@property (nonatomic, strong) TTTAttributedLabel   *label;
@property (nonatomic, strong) NSMutableArray       *links;

@end

@implementation TTTAttributeLabelView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setup];
    }
    
    return self;
}

- (void)setup {
    
    // 存储超链接的数组
    self.links                      = [NSMutableArray array];

    // label
    self.label                      = [[TTTAttributedLabel alloc] initWithFrame:self.bounds];
    self.label.delegate             = self;
    self.label.extendsLinkTouchArea = NO;
    self.label.verticalAlignment    = TTTAttributedLabelVerticalAlignmentTop;
    self.label.numberOfLines        = 0;
    [self addSubview:self.label];
}

- (void)reset {
    self.label.text = nil;
    [self.links removeAllObjects];
}

- (void)render {
    if (self.attributedString.string.length <= 0) {
        return;
    }
    
    self.label.text = self.attributedString;
    
    [self linkStyles];
    
    [self addLinks];
}

- (void)addLinks {

    for (int count = 0; count < self.links.count; count++) {
        
        RangeFlag *rangeflag = self.links[count];
        [self.label addLinkToURL:[NSURL URLWithString:rangeflag.flag] withRange:rangeflag.range];
    }
}

- (void)linkStyles {
    
    
    UIColor           *linkColor                 = (self.linkColor == nil ? [UIColor blueColor] : self.linkColor);
    CTUnderlineStyle   linkUnderLineStyle        = [self checkEnumValueValid:self.linkUnderLineStyle];
    UIColor           *activeLinkColor           = (self.activeLinkColor == nil ? [UIColor redColor] : self.activeLinkColor);
    CTUnderlineStyle   activelinkUnderLineStyle  = [self checkEnumValueValid:self.activelinkUnderLineStyle];

    
    // 没有点击时候的样式
    self.label.linkAttributes       = @{nsStringWithCfString(kCTForegroundColorAttributeName) : linkColor,
                                        nsStringWithCfString(kCTUnderlineStyleAttributeName)  : [NSNumber numberWithInt:linkUnderLineStyle]};
    
    // 点击时候的样式
    self.label.activeLinkAttributes = @{nsStringWithCfString(kCTForegroundColorAttributeName) : activeLinkColor,
                                        nsStringWithCfString(kCTUnderlineStyleAttributeName)  : [NSNumber numberWithInt:activelinkUnderLineStyle]};
}

- (CTUnderlineStyle)checkEnumValueValid:(CTUnderlineStyle)style {
    if (style == kCTUnderlineStyleNone || style == kCTUnderlineStyleSingle || style == kCTUnderlineStyleThick || style == kCTUnderlineStyleDouble) {
        return style;
    } else {
        return kCTUnderlineStyleSingle;
    }
}

- (void)addLinkStringRange:(NSRange)linkStringRange flag:(NSString *)flag {
    [self.links addObject:[RangeFlag rangeFlagWithFlag:flag range:linkStringRange]];
}

- (void)resetSize {
    [self.label sizeToFit];
    
    CGFloat x      = self.frame.origin.x;
    CGFloat y      = self.frame.origin.y;
    CGFloat width  = self.label.frame.size.width;
    CGFloat height = self.label.frame.size.height;

    self.frame = CGRectMake(x, y, width, height);
}

+ (CGSize)sizeThatFitsAttributedString:(NSAttributedString *)attributedString withFixedWidth:(CGFloat)width {
    return [TTTAttributedLabel sizeThatFitsAttributedString:attributedString
                                            withConstraints:CGSizeMake(width, 0)
                                     limitedToNumberOfLines:0];
}

#pragma mark - 超链接代理
- (void)attributedLabel:(TTTAttributedLabel *)label didSelectLinkWithURL:(NSURL *)url {
    if (_delegate && [_delegate respondsToSelector:@selector(TTTAttributeLabelView:linkFlag:)]) {
        [_delegate TTTAttributeLabelView:self linkFlag:url.absoluteString];
    }
}

@end



