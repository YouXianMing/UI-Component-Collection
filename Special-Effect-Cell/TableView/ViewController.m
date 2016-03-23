//
//  ViewController.m
//  TableView
//
//  Created by XianMingYou on 15/4/9.
//  Copyright (c) 2015年 XianMingYou. All rights reserved.
//

#import "ViewController.h"
#import "DataCell.h"



@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray     *dataSource;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];

    // 数据源
    self.dataSource = @[@"YouXianMing", @"Google",
                        @"iOS Developer", @"Android Developer", @"YouTube",
                        @"UI Delveloper", @"PS4 Player", @"XboxOne Player"];
    
    // 初始化tableView
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds
                                                  style:UITableViewStylePlain];
    self.tableView.delegate       = self;
    self.tableView.dataSource     = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerClass:[DataCell class] forCellReuseIdentifier:DATA_CELL];
    [self.view addSubview:self.tableView];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    // 发送广播
    [[NSNotificationCenter defaultCenter] postNotificationName:DATA_CELL
                                                        object:@(scrollView.contentOffset.y)
                                                      userInfo:nil];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    DataCell *cell  = [tableView dequeueReusableCellWithIdentifier:DATA_CELL];
    cell.indexPath  = indexPath;
    cell.label.text = self.dataSource[indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return CELL_HEIGHT;
}

@end
