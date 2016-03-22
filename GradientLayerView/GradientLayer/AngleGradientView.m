//
//  AngleGradientView.m
//  GradientLayer
//
//  Created by YouXianMing on 15/5/15.
//  Copyright (c) 2015年 YouXianMing. All rights reserved.
//

#import "AngleGradientView.h"
#import "AngleGradientLayer.h"


@interface AngleGradientView () {
    
    AngleGradientLayer  *_angleGradientLayer;
    
}

@end


@implementation AngleGradientView

/**
 *  重置layer为AngleGradientLayer
 */
+ (Class)layerClass {
    return [AngleGradientLayer class];
}

- (instancetype)initWithFrame:(CGRect)frame {
    return [self initWithFrame:frame withCGColors:nil withLocations:nil];
}

- (instancetype)initWithFrame:(CGRect)frame withCGColors:(NSArray *)colors withLocations:(NSArray *)locations {
    
    self = [super initWithFrame:frame];
    if (self) {
        _angleGradientLayer = (AngleGradientLayer *)self.layer;
        
        if (colors != nil) {
            _angleGradientLayer.colors    = colors;
            _angleGradientLayer.locations = locations;
        }
        
    }
    
    return self;
}

+ (instancetype)gradientViewWithFrame:(CGRect)frame
                         gradientType:(EAngleGradientType)type {
    
    NSMutableArray    *colors            = nil;
    NSMutableArray    *locations         = nil;
    AngleGradientView *angleGradientView = nil;
    
    
    if (type == GradientMetalTypeOne) {
        
        colors = [[NSMutableArray alloc] initWithCapacity:16];
        [colors addObject:(id)[UIColor colorWithWhite:0.65 alpha:1].CGColor];
        [colors addObject:(id)[UIColor colorWithWhite:0.9 alpha:1].CGColor];
        [colors addObject:(id)[UIColor colorWithWhite:0.75 alpha:1].CGColor];
        [colors addObject:(id)[UIColor colorWithWhite:0.35 alpha:1].CGColor];
        [colors addObject:(id)[UIColor colorWithWhite:0.75 alpha:1].CGColor];
        [colors addObject:(id)[UIColor colorWithWhite:0.9 alpha:1].CGColor];
        [colors addObject:(id)[UIColor colorWithWhite:0.75 alpha:1].CGColor];
        [colors addObject:(id)[UIColor colorWithWhite:0.35 alpha:1].CGColor];
        [colors addObject:(id)[UIColor colorWithWhite:0.55 alpha:1].CGColor];
        [colors addObject:(id)[UIColor colorWithWhite:0.65 alpha:1].CGColor];
        
    } else if (type == GradientMetalTypeTwo) {
        
        colors    = [[NSMutableArray alloc] initWithCapacity:16];
        locations = [[NSMutableArray alloc] initWithCapacity:16];
        [colors addObject:(id)[UIColor colorWithRed:0 green:0 blue:0 alpha:1].CGColor];
        [colors addObject:(id)[UIColor colorWithRed:1 green:1 blue:1 alpha:1].CGColor];
        [locations addObject:[NSNumber numberWithInt:0]];
        [locations addObject:[NSNumber numberWithInt:1]];
        
    } else if (type == GradientRainbow) {
        
        colors = [[NSMutableArray alloc] initWithCapacity:16];
        [colors addObject:(id)[UIColor colorWithRed:1 green:0 blue:0 alpha:1].CGColor];
        [colors addObject:(id)[UIColor colorWithRed:1 green:1 blue:0 alpha:1].CGColor];
        [colors addObject:(id)[UIColor colorWithRed:0 green:1 blue:0 alpha:1].CGColor];
        [colors addObject:(id)[UIColor colorWithRed:0 green:1 blue:1 alpha:1].CGColor];
        [colors addObject:(id)[UIColor colorWithRed:0 green:0 blue:1 alpha:1].CGColor];
        [colors addObject:(id)[UIColor colorWithRed:1 green:0 blue:1 alpha:1].CGColor];
        [colors addObject:(id)[UIColor colorWithRed:1 green:0 blue:0 alpha:1].CGColor];

    }
    
    angleGradientView = [[AngleGradientView alloc] initWithFrame:frame
                                                    withCGColors:colors
                                                   withLocations:locations];
    
    return angleGradientView;
}

@end
