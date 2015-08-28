//
//  UIBarButtonItem+Extension.m
//  0623新浪微博
//
//  Created by yanyin on 15/6/24.
//  Copyright (c) 2015年 system . All rights reserved.
//

#import "UIBarButtonItem+Extension.h"

@implementation UIBarButtonItem (Extension)

+ (UIBarButtonItem *)itemWithImageNamed:(NSString *)name target:(id)target action:(SEL)action
{
    UIButton *button = [[UIButton alloc] init];
    [button setBackgroundImage:[UIImage imageNamed:name] forState:UIControlStateNormal];
    //设置尺寸（有分类）
//    button.size = button.currentBackgroundImage.size;
    CGRect tempF = button.frame;
    tempF.size = button.currentBackgroundImage.size;
    button.frame = tempF;
    
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [[UIBarButtonItem alloc] initWithCustomView:button];
    
}

@end
