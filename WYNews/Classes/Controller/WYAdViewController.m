//
//  WYAdViewController.m
//  WYNews
//
//  Created by wangyue on 15/8/30.
//  Copyright (c) 2015年 yanyin. All rights reserved.
//

#import "WYAdViewController.h"

@implementation WYAdViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    // 设置2秒后显示主控制器
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 加载主控制器
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        window.rootViewController = [storyboard instantiateViewControllerWithIdentifier:@"main"];
    });
    
}

@end
