//
//  DrawRectView.m
//  CGContextObject
//
//  Created by YouXianMing on 15/11/12.
//  Copyright © 2015年 ZiPeiYi. All rights reserved.
//

#import "DrawRectView.h"
#import "CGContextObject.h"

@interface DrawRectView ()

@property (nonatomic, strong)  CGContextObject  *contextObject;

@end

@implementation DrawRectView

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor clearColor];
    }
    
    return self;
}

- (void)drawRect:(CGRect)rect {
    
    _contextObject = [[CGContextObject alloc] initWithCGContext:UIGraphicsGetCurrentContext()
                                                         config:[CGContextObjectConfig new]];
    
    NSInteger widthSegment  = 8;
    NSInteger heightSegment = 8;
    
    CGFloat gridWidth  = self.frame.size.width  / widthSegment;
    CGFloat gridHeight = self.frame.size.height / heightSegment;
    
    
    for (int row = 0; row < widthSegment; row++) {
        
        for (int column = 0; column < heightSegment; column++) {
            
            CGContextObjectConfig *config = [CGContextObjectConfig new];
            config.fillColor              = [RGBColor randomColor];
            
            [_contextObject contextConfig:config drawFillBlock:^(CGContextObject *contextObject) {
                
                [contextObject addRectPath:CGRectMake(row * gridWidth, column * gridHeight, gridWidth, gridHeight)];
            }];
        }
    }
}

@end
