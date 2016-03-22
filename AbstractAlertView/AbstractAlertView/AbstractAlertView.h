//
//  AbstractAlertView.h
//  AlertViewDemo
//
//  Created by YouXianMing on 15/10/15.
//

#import <UIKit/UIKit.h>

@class AbstractAlertView;

@protocol AlertViewEventDelegate <NSObject>

@required
/**
 *  代理执行的事件
 *
 *  @param alertView alertView
 *  @param index     按钮编号
 */
- (void)alertView:(AbstractAlertView *)alertView buttonEventIndex:(NSInteger)index;

@end

@interface AbstractAlertView : UIView

/**
 *  响应事件的代理
 */
@property (nonatomic, weak)   id <AlertViewEventDelegate> delegate;

/**
 *  插入后显示的view
 */
@property (nonatomic, weak)   UIView   *insertView;

/**
 *  标题
 */
@property (nonatomic, strong) NSString *title;

/**
 *  副标题
 */
@property (nonatomic, strong) NSString *subTitle;

/**
 *  信息
 */
@property (nonatomic, strong) NSString *message;

/**
 *  按钮标题数组
 */
@property (nonatomic, strong) NSArray <NSString *> *buttonTitlesArray;

/**
 *  显示(在show的时候构建出view)
 */
- (void)show;

/**
 *  隐藏
 */
- (void)hide;

@end
