//
//  ViewController.m
//  TapLabelView
//
//  Created by YouXianMing on 15/6/13.
//  Copyright (c) 2015年 YouXianMing. All rights reserved.
//

#import "ViewController.h"
#import "TTTAttributeLabelView.h"
#import "NSString+RichText.h"
#import "TTTAttributedLabel.h"

@interface ViewController () <TTTAttributeLabelViewDelegate>

@property (nonatomic, strong) TTTAttributeLabelView  *attributeLabelView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor blackColor];
    
    // 创建富文本
    NSString *string = @"Between the husband and earth, each master. All Gou Fei Wu, although a little and Mo to take. YouXianMing but the river breeze, and the mountain of the moon, ear and sound, eyes meet and fineness. Take no ban, be inexhaustible. Is also the creator of the endless Tibet, and I and the children were appropriate.\n夫天地之间，物各有主。苟非吾之所有，虽一毫而莫取。惟江上之清风，与山间之明月，耳得之而为声，目遇之而成色。 取之无禁，用之不竭。是造物者之无尽藏也，而吾与子之所共适。";
    NSMutableParagraphStyle *style = [NSMutableParagraphStyle new];
    style.lineSpacing              = 4.f;
    style.paragraphSpacing         = style.lineSpacing * 4;
    style.alignment                = NSTextAlignmentCenter;
    NSAttributedString *attributedString  = \
        [string createAttributedStringAndConfig:@[[ConfigAttributedString foregroundColor:[UIColor whiteColor] range:string.range],
                                                  [ConfigAttributedString paragraphStyle:style range:string.range],
                                                  [ConfigAttributedString font:[UIFont fontWithName:@"AppleSDGothicNeo-UltraLight" size:14.f] range:string.range]]];
    
    // 初始化对象
    self.attributeLabelView                    = [[TTTAttributeLabelView alloc] initWithFrame:CGRectMake(10, 50, 300, 0)];
    self.attributeLabelView.attributedString   = attributedString;
    self.attributeLabelView.delegate           = self;
    self.attributeLabelView.linkColor          = [UIColor cyanColor];
    
    // 添加超链接
    NSRange range1 = [string rangeOfString:@"YouXianMing"];
    [self.attributeLabelView addLinkStringRange:range1 flag:@"link1"];
    
    NSRange range2 = [string rangeOfString:@"inexhaustible"];
    [self.attributeLabelView addLinkStringRange:range2 flag:@"link2"];
    
    NSRange range3 = [string rangeOfString:@"耳得之而为声，目遇之而成色。"];
    [self.attributeLabelView addLinkStringRange:range3 flag:@"link3"];
    
    // 进行渲染
    [self.attributeLabelView render];
    [self.attributeLabelView resetSize];
    [self.view addSubview:self.attributeLabelView];
}

- (void)TTTAttributeLabelView:(TTTAttributeLabelView *)attributeLabelView linkFlag:(NSString *)flag {
    NSLog(@"%@", flag);
}

@end
