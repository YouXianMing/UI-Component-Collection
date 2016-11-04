//
//  ImageCell.m
//  SDWebImageViewPlaceHorder
//
//  Created by YouXianMing on 16/8/19.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

#import "ImageCell.h"

@implementation ImageCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {

    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle                        = UITableViewCellSelectionStyleNone;
        self.placeholderImageView                  = [PlaceholderImageView placeholderImageViewWithFrame:CGRectMake(0, 0, 150.f, 150.f)
                                                                                        placeholderImage:[UIImage imageNamed:@"1"]];
        self.placeholderImageView.placeholderImage = [UIImage imageNamed:@"1"];
        [self addSubview:self.placeholderImageView];
    }
    
    return self;
}

@end
