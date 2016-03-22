//
//  FontInfomation.m
//  YouXianMing
//
//  Created by XianMingYou on 15/2/11.
//  Copyright (c) 2015年 XianMingYou. All rights reserved.
//

#import "FontInfomation.h"

static NSMutableDictionary *_systemFontDictionary = nil; // 系统字体信息

@implementation FontInfomation

+ (void)initialize {
    if (self == [FontInfomation class]) {
        _systemFontDictionary = [[NSMutableDictionary alloc] init];
        
        // 获取系统字体族
        [FontInfomation getSystemFontList];
    }
}

+ (void)getSystemFontList {
    NSArray *familyNames = [UIFont familyNames];
    for( NSString *familyName in familyNames) {
        NSArray *fontNames = [UIFont fontNamesForFamilyName:familyName];
        [_systemFontDictionary setObject:fontNames forKey:familyName];
    }
}

+ (NSDictionary *)systomFontNameList {
    return [NSDictionary dictionaryWithDictionary:_systemFontDictionary];
}

+ (NSArray *)fontTitles {
    // 获取字体字典
    NSDictionary *fonts = [FontInfomation systomFontNameList];
    
    // 获取所有字体标题
    NSArray *titles = [[fonts allKeys] sortedArrayWithOptions:NSSortConcurrent
                                              usingComparator:^NSComparisonResult(id obj1, id obj2) {
        NSString *strA = obj1;
        NSString *strB = obj2;
        
        return [strA compare:strB];
    }];

    return titles;
}

@end
