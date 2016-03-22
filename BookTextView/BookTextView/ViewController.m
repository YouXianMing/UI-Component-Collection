//
//  ViewController.m
//  BookTextView
//
//  Created by YouXianMing on 15/5/18.
//  Copyright (c) 2015年 YouXianMing. All rights reserved.
//

#import "ViewController.h"
#import "ParagraphAttributes+Constructor.h"
#import "ExclusionView.h"
#import "BookTextView.h"

#define  Width                             [UIScreen mainScreen].bounds.size.width
#define  Height                            [UIScreen mainScreen].bounds.size.height

@interface ViewController ()<UITextViewDelegate>

@property (strong, nonatomic) BookTextView *bookView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // 读取文本
    NSString *text = [NSString stringWithContentsOfFile:[NSBundle.mainBundle URLForResource:@"lorem" withExtension:@"txt"].path
                                               encoding:NSUTF8StringEncoding
                                                  error:nil];
    
    
    // 初始化bookView
    self.bookView                     = [[BookTextView alloc] initWithFrame:CGRectMake(10, 10, Width - 20, Height - 20)];
    self.bookView.textString          = text;
    
    // 设置段落样式
    self.bookView.paragraphAttributes = [ParagraphAttributes qingKeBengYue];
    
    // 设置富文本
    self.bookView.attributes          = @[[ConfigAttributedString foregroundColor:[[UIColor blackColor] colorWithAlphaComponent:0.75f]
                                                                            range:NSMakeRange(0, 9)],
                                          [ConfigAttributedString font:[UIFont fontWithName:QingKeBengYue size:22.f]
                                                                 range:NSMakeRange(0, 9)]];
    
    // 加载图片
    ExclusionView *exclusionView = [[ExclusionView alloc] initWithFrame:CGRectMake(150.f, 195, 320, 150)];
    self.bookView.exclusionViews = @[exclusionView];
    UIImageView *imageView       = [[UIImageView alloc] initWithFrame:exclusionView.bounds];
    imageView.image              = [UIImage imageNamed:@"demo"];
    [exclusionView addSubview:imageView];
    
    
    // 构建view
    [self.bookView buildWidgetView];
    [self.view addSubview:self.bookView];
    
    
    // 延时0.01s执行
    [self performSelector:@selector(event)
               withObject:nil
               afterDelay:0.01];
}

- (void)event {
    [self.bookView moveToTextPercent:0.00];
}


@end
