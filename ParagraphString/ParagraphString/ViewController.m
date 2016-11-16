//
//  ViewController.m
//  ParagraphString
//
//  Created by YouXianMing on 2016/11/14.
//  Copyright © 2016年 TechCode. All rights reserved.
//

#import "ViewController.h"
#import "NewsModel.h"
#import "NewsCell.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray <NewsModel *> *models;
@property (nonatomic, strong) UITableView                  *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.models = [NSMutableArray array];
    
    [self addTitle:@"Trapped Chinese tourists"
           content:@"CHRISTCHURCH - About 125 Chinese tourists trapped in a tourist resort by a strong quake in New Zealand, have been safely evacuated from the disaster area to Christchurch by helicopters.\nThe magnitude-7.5 earthquake and subsequent aftershocks struck the country's South Island after midnight on Monday, killing two people.\nMore than 1,300 tourists, including the Chinese, were confirmed stranded in Kaikoura, a popular tourist destination famed for its coastal scenery and whale-watching activities."];
    [self addTitle:@"China develops bullet train"
           content:@"Nicknamed \"Panda\" because of their black-and-white nose design, two CRH5E trains came off the assembly line Friday at the CRRC Changchun Railway Vehicle Co. in Changchun, capital of northeast China's Jilin Province, said a manager with the company.\nAmong the 16 carriages on the trains, 13 of them are equipped with compartments with both seats and beds. The beds for night operations can be folded in to seats during the daytime, the manager said."];
    [self addTitle:@"Building bridges"
           content:@"Wuzhen's signature waterways reflect the town's glorious past, Yang Yang reports.\nZhou Qiankang says the soul of Wuzhen lies in the waterways that have run through the town for centuries.\nThe 70-year-old is familiar with every street and bridge in this part of East China.\nHe is also an expert on the town's history for the local government.\nWuzhen's origin can be traced back 7,000 years, according to the discovery of the Tanjiawan archaeological site.\nDuring the Spring and Autumn Period (770-476 BC) and the Warring States Period (475-221 BC), Wuzhen was the border between the Wu state in the north and the Yue state in the south. Wu stationed its troops here in defense."];
    
    self.tableView              = [[UITableView alloc] initWithFrame:self.view.bounds];
    self.tableView.delegate     = self;
    self.tableView.dataSource   = self;
    self.tableView.contentInset = UIEdgeInsetsMake(20.f, 0, 0, 0);
    [self.view addSubview:self.tableView];
    
    [self.tableView registerClass:[NewsCell class] forCellReuseIdentifier:@"NewsCell"];
}

- (void)addTitle:(NSString *)title content:(NSString *)content {

    [self.models addObject:[NewsModel newsModelWithTitle:title content:content]];
}

#pragma mark - <UITableViewDelegate, UITableViewDataSource>

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.models.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NewsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NewsCell"];
    cell.data      = self.models[indexPath.row];
    [cell loadContent];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return self.models[indexPath.row].contentHeight;
}

@end


