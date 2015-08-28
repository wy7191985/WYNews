//
//  WYNavigationController.m
//  WYNews
//
//  Created by yanyin on 15/8/28.
//  Copyright (c) 2015年 yanyin. All rights reserved.
//

#import "WYNavigationController.h"

@interface WYNavigationController ()

@end

@implementation WYNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/**
 *  控制器创建会调用一次
 */
+ (void)initialize
{
    //获得导航栏主题
    UINavigationBar *navBar = [UINavigationBar appearance];
    //设置导航栏背景图片
    [navBar setBackgroundImage:[UIImage imageNamed:@"top_navigation_background"] forBarMetrics:UIBarMetricsDefault];
}

@end
