//
//  PictureCell.m
//  IrregularGridCollectionView
//
//  Created by YouXianMing on 2016/11/7.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

#import "PictureCell.h"
#import "UIView+SetRect.h"

@interface PictureCell ()

@property (nonatomic, strong) UIImageView *showImageView;

@end

@implementation PictureCell

- (void)setupCell {
    
    self.showImageView                     = [[UIImageView alloc] initWithFrame:self.bounds];
    self.showImageView.layer.cornerRadius  = 4.f;
    self.showImageView.layer.masksToBounds = YES;
    [self addSubview:self.showImageView];
}

- (void)loadContent {
    
    self.showImageView.width = self.dataAdapter.itemWidth;
    self.showImageView.image = self.data;
}

@end
