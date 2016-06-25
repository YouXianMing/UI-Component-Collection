//
//  ViewController.m
//  IconEdgeInsetsLabel
//
//  Created by YouXianMing on 16/6/25.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

#import "ViewController.h"
#import "IconEdgeInsetsLabel.h"
#import "UIView+SetRect.h"
#import "HexColors.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 15, 15)];
        imageView.image        = [UIImage imageNamed:@"phone_orange"];
        
        IconEdgeInsetsLabel *label = [IconEdgeInsetsLabel new];
        label.direction            = kIconAtLeft;
        label.gap                  = 5;
        label.iconView             = imageView;
        label.textColor            = [UIColor colorWithHexString:@"FFA824"];
        [label sizeToFitWithText:@"15910514636"];
        
        label.center   = self.view.center;
        label.centerY -= 100;
        
        [self.view addSubview:label];
    }
    
    {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 18, 18)];
        imageView.image        = [UIImage imageNamed:@"tag03"];
        
        IconEdgeInsetsLabel *label = [IconEdgeInsetsLabel new];
        label.direction            = kIconAtLeft;
        label.edgeInsets           = UIEdgeInsetsMake(3, 8, 3, 8);
        label.gap                  = 8.f;
        label.iconView             = imageView;
        label.textColor            = [UIColor whiteColor];
        [label sizeToFitWithText:@"百度一下会死啊"];
        
        UIView *blackView            = [[UIView alloc] initWithFrame:label.bounds];
        blackView.backgroundColor    = [[UIColor blackColor] colorWithAlphaComponent:0.95f];
        blackView.center             = self.view.center;
        blackView.layer.cornerRadius = 3.f;
        [blackView addSubview:label];
        
        [self.view addSubview:blackView];
    }
    
    {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 18, 18)];
        imageView.image        = [UIImage imageNamed:@"ok"];
        
        IconEdgeInsetsLabel *label = [IconEdgeInsetsLabel new];
        label.direction            = kIconAtRight;
        label.gap                  = 10.f;
        label.iconView             = imageView;
        label.textColor            = [UIColor colorWithHexString:@"53BCFF"];
        [label sizeToFitWithText:@"神出鬼没的朝阳群众到底是谁?"];
        
        label.center   = self.view.center;
        label.centerY += 100;
        
        [self.view addSubview:label];
    }
}

@end
