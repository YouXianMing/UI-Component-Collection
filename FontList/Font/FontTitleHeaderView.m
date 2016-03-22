//
//  FontTitleHeaderView.m
//  Font
//
//  Created by XianMingYou on 15/4/8.
//  Copyright (c) 2015年 XianMingYou. All rights reserved.
//

#import "FontTitleHeaderView.h"

@interface FontTitleHeaderView ()

@property (nonatomic, strong) UILabel *title;

@end

@implementation FontTitleHeaderView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        self.title           = [[UILabel alloc] initWithFrame:CGRectMake(7.f, 0, 320, 20)];
        self.title.font      = [UIFont systemFontOfSize:12.f];
        self.title.textColor = [UIColor redColor];
        self.contentView.backgroundColor = [UIColor blackColor];
        [self addSubview:self.title];        
    }
    
    return self;
}

- (void)accessData:(id)data {
    if ([data isKindOfClass:[NSString class]]) {
        self.title.text = data;
    }
}

@end
