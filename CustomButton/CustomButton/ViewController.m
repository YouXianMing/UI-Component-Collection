//
//  ViewController.m
//  CustomButton
//
//  Created by YouXianMing on 16/5/21.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

#import "ViewController.h"
#import "CustomButton.h"
#import "UIView+SetRect.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    {
        CustomButton *button            = [[CustomButton alloc] initWithFrame:CGRectMake(0, 0, 200, 40.f)];
        button.title                    = @"Heiti TC";
        button.center                   = self.view.center;
        button.y                       -= 100;
        button.font                     = [UIFont fontWithName:@"Heiti TC" size:16.f];
        button.layer.borderWidth        = 0.5f;
        button.layer.borderColor        = [UIColor blackColor].CGColor;
        button.layer.cornerRadius       = 4.f;
        button.layer.masksToBounds      = YES;
        button.buttonEvent              = @selector(buttonsEvent:);
        button.target                   = self;
        button.normalBackgroundColor    = [UIColor blackColor];
        button.highlightBackgroundColor = [UIColor whiteColor];
        button.disabledBackgroundColor  = [UIColor grayColor];
        [button setTitleColor:[UIColor whiteColor] state:BaseControlStateNormal];
        [button setTitleColor:[UIColor blackColor] state:BaseControlStateHighlighted];
        [button setTitleColor:[UIColor whiteColor] state:BaseControlStateDisabled];
        
        [self.view addSubview:button];
        [button changeToState:BaseControlStateNormal animated:NO];
    }
    
    {
        CustomButton *button            = [[CustomButton alloc] initWithFrame:CGRectMake(0, 0, 200, 40.f)];
        button.title                    = @"Heiti TC";
        button.tag                      = 2;
        button.center                   = self.view.center;
        button.y                       += 100;
        button.font                     = [UIFont fontWithName:@"Heiti TC" size:16.f];
        button.layer.borderWidth        = 0.5f;
        button.layer.borderColor        = [UIColor orangeColor].CGColor;
        button.layer.cornerRadius       = 4.f;
        button.layer.masksToBounds      = YES;
        button.buttonEvent              = @selector(buttonsEvent:);
        button.target                   = self;
        button.normalBackgroundColor    = [[UIColor orangeColor] colorWithAlphaComponent:0.95f];
        button.highlightBackgroundColor = [[UIColor orangeColor] colorWithAlphaComponent:0.65f];
        button.disabledBackgroundColor  = [[UIColor orangeColor] colorWithAlphaComponent:0.45f];
        [button setTitleColor:[UIColor whiteColor] state:BaseControlStateNormal];
        [button setTitleColor:[UIColor whiteColor] state:BaseControlStateHighlighted];
        [button setTitleColor:[[UIColor whiteColor] colorWithAlphaComponent:0.75f] state:BaseControlStateDisabled];
        
        [self.view addSubview:button];
        [button changeToState:BaseControlStateNormal animated:NO];
    }
}

- (void)buttonsEvent:(CustomButton *)button {
    
    NSLog(@"%@", button);
    
    if (button.tag == 2) {
        
        static int i = 0;
        if (i++ >= 3) {
            
            [button changeToState:BaseControlStateDisabled animated:YES];
            [self performSelector:@selector(changeTitle:) withObject:button afterDelay:0.15f];
        }
    }
}

- (void)changeTitle:(CustomButton *)button {

    button.title = @"DisabledState";
}

@end
