//
//  WYNavigationBar.m
//  WYNews
//
//  Created by wangyue on 15/8/29.
//  Copyright (c) 2015年 yanyin. All rights reserved.
//

#import "WYNavigationBar.h"

@implementation WYNavigationBar

/**
 *  设置左右按钮靠边
 */
- (void)layoutSubviews
{
    [super layoutSubviews];
    // 设置左右按钮的边距
    for (UIButton *button in self.subviews) {
        // 不是UIButton类型,继续下去
        if (![button isKindOfClass:[UIButton class]]) continue;
        if (button.centerX < self.width * 0.5) { //是左边按钮
            button.x = 0;
        } else if (button.centerX > self.width * 0.5) { //是右边的按钮
            button.x = self.width - button.width;
        }
    }
}


@end
