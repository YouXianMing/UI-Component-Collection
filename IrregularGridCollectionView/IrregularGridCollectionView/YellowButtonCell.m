//
//  YellowButtonCell.m
//  IrregularGridCollectionView
//
//  Created by YouXianMing on 2016/11/7.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

#import "YellowButtonCell.h"
#import "UIView+SetRect.h"

@interface YellowButtonCell ()

@property (nonatomic, strong) UIButton *button;

@end

@implementation YellowButtonCell

- (void)setupCell {
    
    self.button = [[UIButton alloc] initWithFrame:self.bounds];
    [self.button setBackgroundImage:[[UIImage imageNamed:@"yellow_nor"] resizableImageWithCapInsets:UIEdgeInsetsMake(6, 6, 6, 6)]
                           forState:UIControlStateNormal];
    [self addSubview:self.button];
    
    [self.button addTarget:self action:@selector(selectedEvent) forControlEvents:UIControlEventTouchUpInside];
}

- (void)loadContent {

    self.button.width = self.dataAdapter.itemWidth;
    [self.button setTitle:[self.data stringValue] forState:UIControlStateNormal];
}

@end
