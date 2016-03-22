//
//  ViewController.m
//  AbstractAlertView
//
//  Created by YouXianMing on 15/10/15.
//  Copyright © 2015年 YouXianMing. All rights reserved.
//

#import "ViewController.h"
#import "AbstractAlertView.h"
#import "NormalAlertView.h"

@interface ViewController () <AlertViewEventDelegate>

@property (nonatomic, strong) AbstractAlertView  *alertView;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blackColor];
    
    self.alertView = [[NormalAlertView alloc] init];
    self.alertView.delegate          = self;
    self.alertView.insertView        = self.view;
    self.alertView.title             = @"Flush Cache";
    self.alertView.message           = @"Are you sure you want to flush the cache? ";
    self.alertView.buttonTitlesArray = @[@"Yes. Flush it!", @"No. Cancel."];
    
    [self performSelector:@selector(alertViewEvent) withObject:nil afterDelay:4.f];
}

- (void)alertViewEvent {
    
    [self.alertView show];
}

- (void)alertView:(AbstractAlertView *)alertView buttonEventIndex:(NSInteger)index {
    
    if (index == 0) {
        
        [alertView hide];
    }
}

@end
