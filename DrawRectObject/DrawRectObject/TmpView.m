//
//  TmpView.m
//  DrawRectObject
//
//  Created by YouXianMing on 16/7/30.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

#import "TmpView.h"
#import "DrawRectObject.h"

@implementation TmpView

- (void)setupDrawingStyles {

    // Default style.
    self.drawRectObject.drawingStyles[@"default"] = [DrawingStyle new];
    
    // Dash style.
    CGFloat *lenths     = CGFloatArrayWithCount(2);
    lenths[0]           = 5.f;
    lenths[1]           = 5.f;
    DrawingStyle *style = [DrawingStyle new];
    style.strokeColor   = [DrawingColor colorWithUIColor:[UIColor redColor]];
    style.lineWidth     = 0.5f;
    style.count         = 2;
    style.phase         = 0;
    style.lengths       = lenths;
    self.drawRectObject.drawingStyles[@"red"] = style;
}

- (void)drawRect:(CGRect)rect {
    
    [super drawRect:rect];
    
    // Create an oval shape to draw.
    UIBezierPath *aPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 200, 100)];
    
    // Set the render colors.
    [[UIColor blackColor] setStroke];
    [[UIColor redColor] setFill];
    
    CGContextRef aRef = UIGraphicsGetCurrentContext();
    
    // If you have content to draw after the shape,
    // save the current state before changing the transform.
    CGContextSaveGState(aRef);
    
    // Adjust the view's origin temporarily. The oval is
    // now drawn relative to the new origin point.
    CGContextTranslateCTM(aRef, 50, 50);
    
    // Adjust the drawing options as needed.
    aPath.lineWidth = 5;
    
    // Fill the path before stroking it so that the fill
    // color does not obscure the stroked line.
    [aPath fill];
    [aPath stroke];
    
    // Restore the graphics state before drawing any other content.
    CGContextRestoreGState(aRef);
}

@end
