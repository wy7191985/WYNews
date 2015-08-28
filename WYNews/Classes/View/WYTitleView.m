//
//  WYTitleView.m
//  WYNews
//
//  Created by yanyin on 15/8/28.
//  Copyright (c) 2015年 yanyin. All rights reserved.
//

#import "WYTitleView.h"

@implementation WYTitleView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        // 设置属性
        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self setImage:[UIImage imageNamed:@"navbar_netease"] forState:UIControlStateNormal];
        self.userInteractionEnabled = NO;
        // 设置按钮高度等于图片高度
        self.height = self.currentImage.size.height;
        //设置文字距离图片内边距
        self.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
        
    }
    return self;
}

- (void)setTitle:(NSString *)title
{
    _title = title;
    // 设置按钮标题
    [self setTitle:title forState:UIControlStateNormal];
    // 计算文字的
    
}

@end
