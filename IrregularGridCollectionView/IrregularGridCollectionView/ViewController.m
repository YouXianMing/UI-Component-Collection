//
//  ViewController.m
//  IrregularGridCollectionView
//
//  Created by YouXianMing on 16/8/30.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

#import "ViewController.h"
#import "UIView+SetRect.h"
#import "IrregularGridCollectionView.h"
#import "RedButtonCell.h"
#import "YellowButtonCell.h"

@interface ViewController () < IrregularGridCollectionViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    // Create dataSource.
    NSMutableArray *arrays = [NSMutableArray array];
    for (int i = 0; i < 30; i++) {
        
        if (arc4random() % 2) {
            
            CGFloat value = arc4random() % 50 + 60;
            [arrays addObject:[RedButtonCell dataAdapterWithData:@(value) type:0 itemWidth:value]];
            
        } else {
            
            CGFloat value = arc4random() % 50 + 60;
            [arrays addObject:[YellowButtonCell dataAdapterWithData:@(value) type:0 itemWidth:value]];
        }
    }
    
    // Create IrregularGridCollectionView.
    IrregularGridCollectionView *irregularGridView = [IrregularGridCollectionView
                                                      irregularGridCollectionViewWithFrame:CGRectMake(0, 20, Width, Height)
                                                      delegate:self
                                                      registerCells:@[gridViewCellClassType([YellowButtonCell class], @"YellowButtonCell"),
                                                                      gridViewCellClassType([RedButtonCell class],    @"RedButtonCell")]
                                                      contentEdgeInsets:UIEdgeInsetsMake(10, 10, 10, 10)
                                                      verticalGap:10
                                                      horizontalGap:10.f
                                                      gridHeight:30.f];
    irregularGridView.adapters = arrays;
    [irregularGridView resetSize];
    [self.view addSubview:irregularGridView];
    
    // Debug.
    if (/* DISABLES CODE */ (0)) {
        
        irregularGridView.layer.borderWidth = 0.5f;
        irregularGridView.layer.borderColor = [UIColor grayColor].CGColor;
    }
}

#pragma mark - IrregularGridCollectionViewDelegate

- (void)irregularGridCollectionView:(IrregularGridCollectionView *)irregularGridCollectionView
                    didSelectedCell:(CustomIrregularGridViewCell *)cell
                              event:(id)event {
    
    // 更新数据的动画
    [irregularGridCollectionView.collectionView performBatchUpdates:^{
        
        [irregularGridCollectionView.adapters removeObjectAtIndex:cell.indexPath.row];
        [irregularGridCollectionView.collectionView deleteItemsAtIndexPaths:@[[NSIndexPath indexPathForRow:cell.indexPath.row inSection:0]]];
        
    } completion:^(BOOL finished) {
        
        // 重置数据
        [irregularGridCollectionView.collectionView reloadData];
        NSLog(@"event -> %@", event);
        [UIView animateWithDuration:0.5f animations:^{
            
            [irregularGridCollectionView resetSize];
        }];
    }];
}

@end
