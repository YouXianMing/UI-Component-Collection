//
//  ViewController.m
//  CGContextObject
//
//  Created by YouXianMing on 15/11/12.
//  Copyright © 2015年 ZiPeiYi. All rights reserved.
//

#import "ViewController.h"
#import "DrawRectViewController.h"
#import "DrawLineViewController.h"
#import "DrawStringViewController.h"
#import "DrawGradientColorViewController.h"
#import "DrawImageViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray     *contextDrawTypes;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"Draws";
    
    [self setup];
}

- (void)setup {
    
    self.contextDrawTypes = @[@"Draw Rect", @"Draw Line", @"Draw String", @"Draw Gradient Color", @"Draw Image"];
    
    self.tableView            = [[UITableView alloc] initWithFrame:self.view.bounds];
    self.tableView.delegate   = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.contextDrawTypes.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    cell.selectionStyle   = UITableViewCellSelectionStyleNone;
    cell.textLabel.text   = self.contextDrawTypes[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    NSString *title = self.contextDrawTypes[indexPath.row];
    
    if ([title isEqualToString:@"Draw Line"]) {
        
        UIViewController *controller = [DrawLineViewController new];
        controller.title             = title;
        [self.navigationController pushViewController:controller animated:YES];
    }
    
    if ([title isEqualToString:@"Draw Rect"]) {
        
        UIViewController *controller = [DrawRectViewController new];
        controller.title             = title;
        [self.navigationController pushViewController:controller animated:YES];
    }

    if ([title isEqualToString:@"Draw String"]) {
        
        UIViewController *controller = [DrawStringViewController new];
        controller.title             = title;
        [self.navigationController pushViewController:controller animated:YES];
    }
    
    if ([title isEqualToString:@"Draw Gradient Color"]) {
        
        UIViewController *controller = [DrawGradientColorViewController new];
        controller.title             = title;
        [self.navigationController pushViewController:controller animated:YES];
    }
    
    if ([title isEqualToString:@"Draw Image"]) {
        
        UIViewController *controller = [DrawImageViewController new];
        controller.title             = title;
        [self.navigationController pushViewController:controller animated:YES];
    }
}

@end
