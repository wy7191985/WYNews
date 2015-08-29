//
//  WYLeftMenu.m
//  WYNews
//
//  Created by yanyin on 15/8/27.
//  Copyright (c) 2015年 yanyin. All rights reserved.
//

#import "WYLeftMenu.h"

@implementation WYLeftMenu

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        //添加按钮
        [self setupButtonWithTitle:@"新闻" imageName:@"sidebar_nav_news"];
        [self setupButtonWithTitle:@"订阅" imageName:@"sidebar_nav_reading"];
        [self setupButtonWithTitle:@"图片" imageName:@"sidebar_nav_photo"];
        [self setupButtonWithTitle:@"视频" imageName:@"sidebar_nav_video"];
        [self setupButtonWithTitle:@"跟贴" imageName:@"sidebar_nav_comment"];
        [self setupButtonWithTitle:@"电台" imageName:@"sidebar_nav_radio"];
    }
    return self;
}
/**
 *  添加按钮
 */
- (void)setupButtonWithTitle:(NSString *)title imageName:(NSString *)imageName
{
    UIButton *button = [[UIButton alloc] init];
    [button setTitle:title forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    //设置内容靠左
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    //设置内边距
    button.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    button.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
    
    
    
    [self addSubview:button];
    
}
/**
 *  设置frame
 */
- (void)layoutSubviews
{
    [super layoutSubviews];
    //按钮个数
    NSInteger count = self.subviews.count;
    //按钮宽高
    CGFloat btnW = self.width;
    CGFloat btnH = self.height / count;
    //遍历子控件
    for (int i = 0; i < count; i++) {
        UIButton *button = self.subviews[i];
        button.width = btnW;
        button.height = btnH;
        button.x = 0;
        button.y = btnH * i;
        
    }
}
- (void)imageViewWithColor:(UIColor *)color
{
    
}



@end
