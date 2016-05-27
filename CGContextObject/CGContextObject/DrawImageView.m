//
//  DrawImageView.m
//  CGContextObject
//
//  Created by YouXianMing on 15/11/16.
//  Copyright © 2015年 ZiPeiYi. All rights reserved.
//

#import "DrawImageView.h"
#import "CGContextObject.h"

@interface DrawImageView ()

@property (nonatomic, strong)  CGContextObject  *contextObject;

@end

@implementation DrawImageView

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor clearColor];
    }
    
    return self;
}

- (void)drawRect:(CGRect)rect {
    
    _contextObject = [[CGContextObject alloc] initWithCGContext:UIGraphicsGetCurrentContext()
                                                         config:[CGContextObjectConfig new]];
    
    [_contextObject drawImage:[UIImage imageNamed:@"image"]
              asPatternInRect:self.bounds];
}

@end
