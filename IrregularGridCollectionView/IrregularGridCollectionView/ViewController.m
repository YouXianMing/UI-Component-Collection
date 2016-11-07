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
#import "PictureCell.h"
#import "RedButtonCell.h"
#import "YellowButtonCell.h"
#import "Math.h"

typedef enum : NSUInteger {
    
    DirectionHorizontalType = 1000,
    DirectionVerticalType,
    
} IrregularGridCollectionViewTag;

@interface ViewController () < IrregularGridCollectionViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self createDirectionHorizontalType];
    
    [self createDirectionVerticalType];
}

- (void)createDirectionHorizontalType {
    
    // Create dataSource.
    NSArray *images = @[[UIImage imageNamed:@"1.jpg"],
                        [UIImage imageNamed:@"2.jpg"],
                        [UIImage imageNamed:@"3.jpg"],
                        [UIImage imageNamed:@"4.jpg"]];
    
    NSMutableArray *arrays = [NSMutableArray array];
    [images enumerateObjectsUsingBlock:^(UIImage *image, NSUInteger idx, BOOL * _Nonnull stop) {
        
        [arrays addObject:[PictureCell dataAdapterWithData:image itemWidth:[Math resetFromSize:image.size withFixedHeight:100].width]];
    }];
    
    // Create IrregularGridCollectionView.
    IrregularGridCollectionView *irregularGridView;
    CGFloat height    = 10 + 100 + 10; // EdgeInsetTop + GridHeight + EdgeInsetBottom
    irregularGridView = [IrregularGridCollectionView irregularGridCollectionViewWithFrame:CGRectMake(0, 20, Width, height)
                                                                                 delegate:self
                                                                            registerCells:@[gridViewCellClassType([PictureCell class], @"PictureCell")]
                                                                          scrollDirection:UICollectionViewScrollDirectionHorizontal
                                                                        contentEdgeInsets:UIEdgeInsetsMake(10, 10, 10, 10)
                                                                              verticalGap:10.f
                                                                            horizontalGap:10.f
                                                                               gridHeight:100.f];
    irregularGridView.tag      = DirectionHorizontalType;
    irregularGridView.adapters = arrays;
    [self.view addSubview:irregularGridView];
    
    // Debug.
    if (/* DISABLES CODE */ (1)) {
        
        irregularGridView.layer.borderWidth = 0.5f;
        irregularGridView.layer.borderColor = [[UIColor grayColor] colorWithAlphaComponent:0.35f].CGColor;
    }
}

- (void)createDirectionVerticalType {

    // Create dataSource.
    NSMutableArray *arrays = [NSMutableArray array];
    for (int i = 0; i < 24; i++) {
        
        CGFloat value = arc4random() % 50 + 60;
        
        arc4random() % 2 ?
        [arrays addObject:[RedButtonCell dataAdapterWithData:@(value) type:0 itemWidth:value]] :
        [arrays addObject:[YellowButtonCell dataAdapterWithData:@(value) type:0 itemWidth:value]];
    }
    
    // Create IrregularGridCollectionView.
    IrregularGridCollectionView *irregularGridView;
    irregularGridView = [IrregularGridCollectionView irregularGridCollectionViewWithFrame:CGRectMake(0, 10 + 20 + 120, Width, 0)
                                                                                 delegate:self
                                                                            registerCells:@[gridViewCellClassType([YellowButtonCell class], @"YellowButtonCell"),
                                                                                            gridViewCellClassType([RedButtonCell class],    @"RedButtonCell")]
                                                                          scrollDirection:UICollectionViewScrollDirectionVertical
                                                                        contentEdgeInsets:UIEdgeInsetsMake(10, 10, 10, 10)
                                                                              verticalGap:10
                                                                            horizontalGap:10.f
                                                                               gridHeight:30.f];
    irregularGridView.tag      = DirectionVerticalType;
    irregularGridView.adapters = arrays;
    [irregularGridView resetSize];
    [self.view addSubview:irregularGridView];
    
    // Debug.
    if (/* DISABLES CODE */ (1)) {
        
        irregularGridView.layer.borderWidth = 0.5f;
        irregularGridView.layer.borderColor = [[UIColor grayColor] colorWithAlphaComponent:0.35f].CGColor;
    }
}

#pragma mark - IrregularGridCollectionViewDelegate

- (void)irregularGridCollectionView:(IrregularGridCollectionView *)irregularGridCollectionView
                    didSelectedCell:(CustomIrregularGridViewCell *)cell
                              event:(id)event {
    
    if (irregularGridCollectionView.tag == DirectionVerticalType) {
        
        // 更新数据的动画
        [irregularGridCollectionView.collectionView performBatchUpdates:^{
            
            [irregularGridCollectionView.adapters removeObjectAtIndex:cell.indexPath.row];
            [irregularGridCollectionView.collectionView deleteItemsAtIndexPaths:@[[NSIndexPath indexPathForRow:cell.indexPath.row inSection:0]]];
            
        } completion:^(BOOL finished) {
            
            // 重置数据
            [irregularGridCollectionView.collectionView reloadData];
            NSLog(@"event -> %@", event);
            [UIView animateWithDuration:0.35f animations:^{
                
                [irregularGridCollectionView resetSize];
            }];
        }];
    }
}

@end
