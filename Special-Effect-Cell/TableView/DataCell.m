//
//  DataCell.m
//  TableView
//
//  Created by XianMingYou on 15/4/9.
//  Copyright (c) 2015年 XianMingYou. All rights reserved.
//

#import "DataCell.h"
#import "UIView+SetRect.h"


@interface DataCell ()
@property (nonatomic, strong) UIView *blackView;
@end


@implementation DataCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle  = UITableViewCellSelectionStyleNone;
        
        // 注册通知中心
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(notificationEvent:)
                                                     name:DATA_CELL
                                                   object:nil];
        
        // 构建子控件
        [self buildViews];
    }
    
    return self;
}

- (void)buildViews {
    self.label      = [[UILabel alloc] initWithFrame:CGRectMake(30, 0, 300, CELL_HEIGHT)];
    self.label.font = [UIFont fontWithName:@"Avenir-BookOblique" size:30.f];
    [self addSubview:self.label];
    
    self.blackView = [[UIView alloc] initWithFrame:CGRectMake(10 + 50, 80, 150, 2)];
    self.blackView.backgroundColor = [UIColor blackColor];
    [self addSubview:self.blackView];
}

- (void)notificationEvent:(id)sender {
    
    NSDictionary *data    = sender;
    CGFloat       offsetY = [[data valueForKey:@"object"] floatValue] - self.indexPath.row * CELL_HEIGHT;
    
    if (offsetY >= 0 && offsetY <= CELL_HEIGHT) {
        // 根据百分比计算
        CGFloat percent  = 1 - offsetY / CELL_HEIGHT;
        
        // 设置值
        self.label.alpha = percent;
        self.blackView.x = 10 + percent * 50;
        
    } else if (offsetY >= - CELL_HEIGHT * 5 && offsetY <= - CELL_HEIGHT * 4) {
        // 根据百分比计算
        CGFloat percent  = (offsetY + CELL_HEIGHT) / CELL_HEIGHT + 4;
        
        // 设置值
        self.label.alpha = percent;
        self.blackView.x = 10 + 50 + (1 - percent) * 50;
    } else {
        // 复位
        self.label.alpha = 1.f;
        self.blackView.x = 10 + 50;
    }
}

- (void)dealloc {
    // 移除通知中心
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:DATA_CELL
                                                  object:nil];
}

@end
