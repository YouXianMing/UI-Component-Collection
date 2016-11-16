//
//  NewsCell.m
//  ParagraphString
//
//  Created by YouXianMing on 2016/11/16.
//  Copyright © 2016年 TechCode. All rights reserved.
//

#import "NewsCell.h"
#import "NewsModel.h"
#import "UIView+SetRect.h"

@interface NewsCell ()

@property (nonatomic, strong) UILabel *titleTextLabel;
@property (nonatomic, strong) UILabel *contentTextLabel;

@end

@implementation NewsCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {

    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        self.titleTextLabel      = [[UILabel alloc] initWithFrame:CGRectMake(15, 15.f, Width - 30.f, 20)];
        self.titleTextLabel.font = [UIFont fontWithName:@"InputMono-Light" size:14.f];
        [self addSubview:self.titleTextLabel];
        
        self.contentTextLabel               = [[UILabel alloc] init];
        self.contentTextLabel.numberOfLines = 0;
        [self addSubview:self.contentTextLabel];
    }
    
    return self;
}

- (void)loadContent {

    NewsModel *model = self.data;
    
    self.titleTextLabel.text = model.title;
    
    self.contentTextLabel.left           = 15.f;
    self.contentTextLabel.top            = 50.f;
    self.contentTextLabel.width          = Width - 30.f;
    self.contentTextLabel.attributedText = model.attributedContent;
    [self.contentTextLabel sizeToFit];
}

@end
