//
//  WYTitleView.m
//  WYNews
//
//  Created by wangyue on 15/8/29.
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
        self.width = 300;
        self.height = 30;
        self.userInteractionEnabled = NO;
        // 标题的内边距
        self.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
    }
    return self;
}

- (void)setTitle:(NSString *)title
{
    _title = [title copy];
    
}



@end
