//
//  NewsCell.h
//  ParagraphString
//
//  Created by YouXianMing on 2016/11/16.
//  Copyright © 2016年 TechCode. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsCell : UITableViewCell

@property (nonatomic, weak) id data;

- (void)loadContent;

@end
