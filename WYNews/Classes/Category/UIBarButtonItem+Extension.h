//
//  UIBarButtonItem+Extension.h
//  0623新浪微博
//
//  Created by yanyin on 15/6/24.
//  Copyright (c) 2015年 system . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)
/**
 *  设置导航栏左右按钮
 *
 *  @param name            按钮图片
 *  @param highlightedName 高亮图片
 *  @param target          监听者
 *  @param action          监听方法
 */
+ (UIBarButtonItem *)itemWithImageNamed:(NSString *)name target:(id)target action:(SEL)action;

@end
