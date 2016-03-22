//
//  BookTextView.m
//  InTheQuietNight
//
//  Created by YouXianMing on 15/5/18.
//  Copyright (c) 2015年 XianMingYou. All rights reserved.
//

#import "BookTextView.h"

typedef enum : NSUInteger {
    EBOOK_NONE,              // 什么也不做
    EBOOK_CALCULATE_HEIGHT,  // 计算文本高度
} EBookTextViewStatus;

@interface BookTextView ()<UITextViewDelegate> {
    EBookTextViewStatus _bookStatus;
    
    CGFloat             _tmpOffsetY;
    CGFloat             _tmpPercent;
}

@property (nonatomic, strong)   UITextView     *textView;
@property (nonatomic)           CGFloat         textHeight;
@property (nonatomic)           CGFloat         currentPercent;

@end

@implementation BookTextView



- (void)buildWidgetView {
    
    
    // 获取长宽
    CGFloat width  = self.frame.size.width;
    CGFloat height = self.frame.size.height;
    
    
    // 创建文本容器并设置段落样式
    NSTextStorage *storage = [[NSTextStorage alloc] initWithString:self.textString
                                                        attributes:self.paragraphAttributes];
    
    
    // 设置富文本
    for (int count = 0; count < _attributes.count; count++) {
        ConfigAttributedString *oneConfig = _attributes[count];
        [storage addAttribute:oneConfig.attribute
                        value:oneConfig.value
                        range:oneConfig.range];
    }
    
    // 管理器
    NSLayoutManager *layoutManager = [NSLayoutManager new];
    [storage addLayoutManager:layoutManager];
    
    
    // 显示的容器
    NSTextContainer *textContainer = [NSTextContainer new];
    CGSize size                    = CGSizeMake(width, MAXFLOAT);
    textContainer.size             = size;
    [layoutManager addTextContainer:textContainer];
    
    
    // 给TextView添加带有内容和布局的容器
    self.textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, width, height)
                                        textContainer:textContainer];
    self.textView.scrollEnabled                    = YES;
    self.textView.editable                         = NO;
    self.textView.selectable                       = NO;
    self.textView.layer.masksToBounds              = YES;
    self.textView.showsVerticalScrollIndicator     = NO;
    self.textView.delegate                         = self;
    
    
    // 如果有额外的views
    if (self.exclusionViews) {
        
        NSMutableArray *pathArray = [NSMutableArray arrayWithCapacity:_exclusionViews.count];
        
        // 添加view + 添加path
        for (int count = 0; count < _exclusionViews.count; count++) {
            
            // 添加view
            ExclusionView *tmpView = _exclusionViews[count];
            [_textView addSubview:tmpView];
            
            // 添加path
            [pathArray addObject:tmpView.createUIBezierPath];
        }
        
        textContainer.exclusionPaths = pathArray;
    }
    
    // 添加要显示的view
    [self addSubview:self.textView];
    
    
    // 存储文本高度
    [self storeBookHeight];
}

- (void)storeBookHeight {
    
    // 先偏移到文本末尾位置
    _bookStatus = EBOOK_CALCULATE_HEIGHT;
    [UIView setAnimationsEnabled:NO];
    [self.textView scrollRangeToVisible:NSMakeRange([self.textView.text length], 0)];
    [UIView setAnimationsEnabled:YES];
    _bookStatus = EBOOK_NONE;
    
    // 再偏移到文本开头位置
    [UIView setAnimationsEnabled:NO];
    [self.textView scrollRangeToVisible:NSMakeRange(0, 0)];
    [UIView setAnimationsEnabled:YES];
}

- (void)moveToTextPosition:(CGFloat)position {
    [self.textView setContentOffset:CGPointMake(0, position) animated:NO];
}

- (void)moveToTextPercent:(CGFloat)percent {
    
    // 计算出百分比
    CGFloat position = 0.f;
    if (percent >= 0 && percent <= 1) {
        position = percent * _textHeight;
    } else if (percent < 0) {
        position = 0.f;
    } else {
        position = _textHeight;
    }
    
    // 移动到指定的位置
    [self.textView setContentOffset:CGPointMake(0, position) animated:NO];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    // Y轴偏移量
    _tmpOffsetY = scrollView.contentOffset.y;
    if (_bookStatus == EBOOK_NONE) {
        
        
        _tmpPercent = _tmpOffsetY / _textHeight;
        if (_tmpPercent >= 0 && _tmpPercent <= 1) {
            _currentPercent = _tmpPercent;
        } else if (_tmpPercent < 0) {
            _currentPercent = 0.f;
        } else {
            _currentPercent = 1.f;
        }
        
        
        NSLog(@"%f", _currentPercent);
        
        
    } else if (_bookStatus == EBOOK_CALCULATE_HEIGHT) {
        self.textHeight = scrollView.contentOffset.y;
    }
}

@end
