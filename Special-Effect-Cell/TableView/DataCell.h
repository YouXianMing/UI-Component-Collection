//
//  DataCell.h
//  TableView
//
//  Created by XianMingYou on 15/4/9.
//  Copyright (c) 2015年 XianMingYou. All rights reserved.
//

#import <UIKit/UIKit.h>

#define  DATA_CELL    @"DataCell"
#define  CELL_HEIGHT  (56.8f * 2)


@interface DataCell : UITableViewCell

@property (nonatomic, strong) NSIndexPath  *indexPath;
@property (nonatomic, strong) UILabel      *label;

@end
