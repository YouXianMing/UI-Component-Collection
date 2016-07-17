//
//  ViewController.m
//  CollectionGridView
//
//  Created by YouXianMing on 16/7/17.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

#import "ViewController.h"
#import "CollectionGridView.h"
#import "UIView+SetRect.h"
#import "SelectedCollectionViewCell.h"
#import "CityModel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    // Data source.
    NSMutableArray *adapters = [NSMutableArray array];
    NSArray        *cities   = @[@"北京", @"武汉", @"深圳", @"大连", @"咸宁", @"东莞", @"保定"];
    for (NSString *city in cities) {
        
        CityModel *model = [CityModel new];
        model.name       = city;
        [adapters addObject:[SelectedCollectionViewCell dataAdapterWithCellReuseIdentifier:nil data:model type:0]];
    }
    
    // CollectionGridView
    CollectionGridView *gridView = [[CollectionGridView alloc] initWithFrame:CGRectMake(0, 0, Width, 20)];
    gridView.layer.borderWidth   = 0.5f;
    gridView.contentEdgeInsets   = UIEdgeInsetsMake(15, 15, 15, 15);
    gridView.verticalGap         = 15.f;
    gridView.horizontalGap       = 15.f;
    gridView.gridHeight          = 25.f;
    gridView.horizontalCellCount = 3;
    gridView.registerCells       = @[gridViewCellClassType([SelectedCollectionViewCell class] , @"SelectedCollectionViewCell")];
    gridView.adapters            = adapters;
    [gridView makeTheConfigEffective];
    [gridView resetSize];
    [self.view addSubview:gridView];
    
    // Reset position.
    gridView.center = self.view.middlePoint;
}

@end
