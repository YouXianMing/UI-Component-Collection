//
//  ViewController.m
//  SDWebImageViewPlaceHorder
//
//  Created by YouXianMing on 16/8/19.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

#import "ViewController.h"
#import "UIImageView+WebCache.h"
#import "PlaceholderImageView.h"
#import "ImageCell.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView  *tableView;
@property (nonatomic, strong) NSArray      *pictures;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.pictures = @[@"https://pic.cnblogs.com/avatar/607542/20151017230728.png",
                      @"https://pic.cnblogs.com/face/607741/20140226202001.png",
                      @"https://pic.cnblogs.com/face/815231/20150923160245.png",
                      @"https://pic.cnblogs.com/face/993558/20160729092113.png",
                      @"https://pic.cnblogs.com/face/894202/20160217151952.png",
                      @"https://pic.cnblogs.com/face/968459/20160709111712.png",
                      @"https://pic.cnblogs.com/face/145865/20160210174306.png",
                      @"https://pic.cnblogs.com/face/796658/20151026090914.png",
                      @"https://pic.cnblogs.com/face/933887/20160629214007.png",
                      @"https://pic.cnblogs.com/face/125303/20130313094252.png",
                      @"https://pic.cnblogs.com/face/976232/20160730173456.png",
                      @"https://pic.cnblogs.com/face/969708/20160602120239.png",
                      @"https://pic.cnblogs.com/face/954541/20160705113740.png",
                      @"https://pic.cnblogs.com/face/799942/20150818204115.png"];
        
    self.tableView            = [[UITableView alloc] initWithFrame:self.view.bounds];
    self.tableView.delegate   = self;
    self.tableView.dataSource = self;
    self.tableView.rowHeight  = 150.f;
    [self.view addSubview:self.tableView];
    
    [self.tableView registerClass:[ImageCell class] forCellReuseIdentifier:@"ImageCell"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return _pictures.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    ImageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ImageCell"];
    cell.placeholderImageView.urlString = _pictures[indexPath.row];
    
    return cell;
}

@end
