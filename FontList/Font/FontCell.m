//
//  FontCell.m
//  Font
//
//  Created by XianMingYou on 15/4/8.
//  Copyright (c) 2015年 XianMingYou. All rights reserved.
//

#import "FontCell.h"

@interface FontCell ()

@property (nonatomic, strong) UILabel *fontLabel;

@end

@implementation FontCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        self.fontLabel               = [[UILabel alloc] initWithFrame:CGRectMake(14.f, 0, 300, 44)];
        self.fontLabel.textAlignment = NSTextAlignmentLeft;
        [self addSubview:self.fontLabel];
    }
    
    return self;
}

- (void)accessData:(id)data {
    if ([data isKindOfClass:[NSString class]]) {
        self.fontLabel.text = data;
        self.fontLabel.font = [UIFont fontWithName:data size:14.f];
    }
}

@end
