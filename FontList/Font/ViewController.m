//
//  ViewController.m
//  Font
//
//  Created by XianMingYou on 15/4/8.
//  Copyright (c) 2015年 XianMingYou. All rights reserved.
//

#import "ViewController.h"
#import "FontInfomation.h"
#import "FontCell.h"
#import "FontTitleHeaderView.h"

#define FONT_CELL  @"FontCell"
#define FONT_TITLE @"FontTitleHeaderView"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView  *tableView;
@property (nonatomic, strong) NSArray      *titlesArray;
@property (nonatomic, strong) NSDictionary *fontLists;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 初始化数据源
    self.titlesArray = [NSArray arrayWithArray:[FontInfomation fontTitles]];
    self.fontLists   = [NSDictionary dictionaryWithDictionary:[FontInfomation systomFontNameList]];
    
    // 加载tableView
    [self.view addSubview:self.tableView];
}


- (UIView *)tableView {
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds
                                                      style:UITableViewStylePlain];
        _tableView.delegate       = self;
        _tableView.dataSource     = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[FontCell class] forCellReuseIdentifier:FONT_CELL];
        [_tableView registerClass:[FontTitleHeaderView class] forHeaderFooterViewReuseIdentifier:FONT_TITLE];
    }
    
    return _tableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *fontArray = self.fontLists[self.titlesArray[section]];
    
    return fontArray.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.titlesArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FontCell *cell = [tableView dequeueReusableCellWithIdentifier:FONT_CELL];
    
    NSArray  *fontArray = self.fontLists[self.titlesArray[indexPath.section]];
    NSString *fontName  = fontArray[indexPath.row];
    
    [cell accessData:fontName];
    
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    FontTitleHeaderView *titleView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:FONT_TITLE];
    
    [titleView accessData:self.titlesArray[section]];
    
    return titleView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 20;
}

@end
