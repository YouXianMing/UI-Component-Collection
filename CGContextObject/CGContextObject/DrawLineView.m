//
//  DrawLineView.m
//  CGContextObject
//
//  Created by YouXianMing on 15/11/12.
//  Copyright © 2015年 ZiPeiYi. All rights reserved.
//

#import "DrawLineView.h"
#import "CGContextObject.h"

@interface DrawLineView ()

@property (nonatomic, strong)  CGContextObject  *contextObject;

@end

@implementation DrawLineView

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor clearColor];
    }
    
    return self;
}

- (void)drawRect:(CGRect)rect {

    _contextObject = [[CGContextObject alloc] initWithCGContext:UIGraphicsGetCurrentContext()
                                                         config:[CGContextObjectConfig new]];
    
    NSInteger widthSegment = 10;
    CGFloat gridWidth      = self.frame.size.width  / widthSegment;
    CGFloat height         = self.frame.size.height;
    
    NSMutableArray *upPoints   = [NSMutableArray array];
    NSMutableArray *downPoints = [NSMutableArray array];
    
    for (int row = 0; row <= widthSegment; row++) {
        
        CGPoint   upPoint       = CGPointMake(row * gridWidth, arc4random() % (int)(height / 2.f));
        NSString *upPointString = NSStringFromCGPoint(upPoint);
        [upPoints addObject:upPointString];
        
        CGPoint   downPoint       = CGPointMake(row * gridWidth, arc4random() % (int)(height / 2.f) + (int)(height / 2.f));
        NSString *downPointString = NSStringFromCGPoint(downPoint);
        [downPoints addObject:downPointString];

        // draw up point
        {
            CGContextObjectConfig *config = [CGContextObjectConfig new];
            config.fillColor              = [RGBColor randomColor];
            [_contextObject contextConfig:config drawFillBlock:^(CGContextObject *contextObject) {
                
                [_contextObject addEllipseInRectPath:CGRectMake(upPoint.x - 3, upPoint.y - 3, 6, 6)];
            }];
        }
        
        // draw down point
        {
            CGContextObjectConfig *config1 = [CGContextObjectConfig new];
            config1.fillColor              = [RGBColor randomColor];
            [_contextObject contextConfig:config1 drawFillBlock:^(CGContextObject *contextObject) {
                
                [_contextObject addEllipseInRectPath:CGRectMake(downPoint.x - 3, downPoint.y - 3, 6, 6)];
            }];
            
            CGContextObjectConfig *config2 = [CGContextObjectConfig new];
            config2.fillColor              = [RGBColor colorWithUIColor:[UIColor whiteColor]];
            [_contextObject contextConfig:config2 drawFillBlock:^(CGContextObject *contextObject) {
                
                [_contextObject addEllipseInRectPath:CGRectMake(downPoint.x - 2, downPoint.y - 2, 4, 4)];
            }];
        }
    }
    
    // draw up line
    [_contextObject contextConfig:nil drawStrokeBlock:^(CGContextObject *contextObject) {
        
        [contextObject addLinePoints:upPoints];
    }];
    
    // draw down line
    CGFloat lengths[] = {3, 3};
    CGContextObjectConfig *config = [CGContextObjectConfig new];
    config.lineWidth              = 0.5f;
    config.lengths                = lengths;
    config.phase                  = 0;
    config.count                  = 2;
    config.strokeColor            = [RGBColor colorWithUIColor:[UIColor redColor]];
    
    [_contextObject contextConfig:config drawStrokeBlock:^(CGContextObject *contextObject) {
        
        [contextObject addLinePoints:downPoints];
    }];
}

@end
