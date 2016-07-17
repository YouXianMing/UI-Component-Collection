//
//  SelectedCollectionViewCell.m
//  CollectionGridView
//
//  Created by YouXianMing on 16/7/17.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

#import "SelectedCollectionViewCell.h"
#import "CityModel.h"

typedef enum : NSUInteger {
    
    kNormalState = 1000,
    kSelectedState,
    
} ESelectedCollectionViewCellState;

@interface SelectedCollectionViewCell ()

@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UIView  *contentBackgroundView;

@end

@implementation SelectedCollectionViewCell

- (void)buildSubview {

    self.contentBackgroundView                     = [[UIView alloc] initWithFrame:self.bounds];
    self.contentBackgroundView.layer.borderWidth   = 0.5f;
    self.contentBackgroundView.layer.cornerRadius  = 2.f;
    self.contentBackgroundView.layer.masksToBounds = YES;
    self.contentBackgroundView.layer.borderColor   = [[UIColor grayColor] colorWithAlphaComponent:0.25].CGColor;
    [self addSubview:self.contentBackgroundView];
    
    self.label               = [[UILabel alloc] initWithFrame:self.bounds];
    self.label.font          = [UIFont systemFontOfSize:13.f];
    self.label.textAlignment = NSTextAlignmentCenter;
    self.label.textColor     = [UIColor redColor];
    [self addSubview:self.label];
}

- (void)loadContent {

    CityModel *model = self.data;
    self.label.text  = model.name;
    model.selected ? ([self changeToState:kSelectedState animated:NO]) : ([self changeToState:kNormalState animated:NO]);
}

- (void)selectedEvent {

    CityModel *model = self.data;
    model.selected ? (model.selected = NO, [self changeToState:kNormalState animated:YES]) : (model.selected = YES, [self changeToState:kSelectedState animated:YES]);
}

- (void)changeToState:(ESelectedCollectionViewCellState)state animated:(BOOL)animated {
    
    [UIView animateKeyframesWithDuration:animated ? 0.25f : 0 delay:0
                                 options:UIViewKeyframeAnimationOptionBeginFromCurrentState | UIViewKeyframeAnimationOptionAllowUserInteraction
                              animations:^{
                                  
                                  if (state == kNormalState) {
                                      
                                      self.contentBackgroundView.backgroundColor = [UIColor whiteColor];
                                      self.label.alpha                           = 0.5f;
                                      
                                  } else if (state == kSelectedState) {
                                      
                                      self.contentBackgroundView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.95f];
                                      self.label.alpha                           = 1.f;
                                  }
                                  
                              } completion:nil];
}

@end
