//
//  GradientColorView.h
//  GradientColorView
//
//  Created by YouXianMing on 15/12/15.
//  Copyright © 2015年 YouXianMing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GradientColorView : UIView

/**
 *  CGColor's array.
 */
@property (nonatomic, strong) NSArray   *colors;

/**
 *  CGColor's location.
 */
@property (nonatomic, strong) NSArray   *locations;

/**
 *  Start point.
 */
@property (nonatomic) CGPoint startPoint;

/**
 *  End point.
 */
@property (nonatomic) CGPoint endPoint;

/**
 *  After you have set all the properties, you should run this method to make it effect.
 */
- (void)becomeEffective;

@end