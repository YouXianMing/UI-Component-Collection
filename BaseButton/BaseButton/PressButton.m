//
//  PressButton.m
//  BaseButton
//
//  Created by YouXianMing on 15/8/27.
//  Copyright (c) 2015年 YouXianMing. All rights reserved.
//

#import "PressButton.h"

@interface PressButton ()

@property (nonatomic, strong) UIView *lineView;

@property (nonatomic) CGFloat width;
@property (nonatomic) CGFloat height;

@end

@implementation PressButton

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        _height = frame.size.height;
        _width  = frame.size.width;
        
        [self pressButtonSetup];
    }
    
    return self;
}

- (void)pressButtonSetup {

    self.lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, _width / 3.f, 4)];
    self.lineView.backgroundColor = [UIColor blackColor];
    [self addSubview:self.lineView];
}

- (void)touchEvent {

    [UIView animateWithDuration:0.5f delay:0.f usingSpringWithDamping:1.f initialSpringVelocity:0.f options:UIViewAnimationOptionAllowUserInteraction animations:^{
        
        self.lineView.frame           = CGRectMake(0, 0, _width / 3.f, 4);
        self.lineView.backgroundColor = [UIColor blackColor];
        
    } completion:^(BOOL finished) {
        
    }];
    
    if (_delegate && [_delegate respondsToSelector:@selector(pressButtonEvent:)]) {
        
        [_delegate pressButtonEvent:self];
    }
}

- (void)touchDragExit {

    [UIView animateWithDuration:0.5f delay:0.f usingSpringWithDamping:1.f initialSpringVelocity:0.f options:UIViewAnimationOptionAllowUserInteraction animations:^{
        
        self.lineView.frame           = CGRectMake(0, 0, _width / 3.f, 4);
        self.lineView.backgroundColor = [UIColor blackColor];
        
    } completion:^(BOOL finished) {
        
    }];
}

- (void)touchBegin {

    [UIView animateWithDuration:0.5f delay:0.f usingSpringWithDamping:1.f initialSpringVelocity:0.f options:UIViewAnimationOptionAllowUserInteraction animations:^{
        
        self.lineView.frame           = CGRectMake(_width / 3.f, 0, _width / 3.f, 4);
        self.lineView.backgroundColor = [UIColor redColor];
        
    } completion:^(BOOL finished) {
        
    }];
}

@end
