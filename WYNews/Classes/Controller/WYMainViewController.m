//
//  WYMainViewController.m
//  WYNews
//
//  Created by yanyin on 15/8/27.
//  Copyright (c) 2015年 yanyin. All rights reserved.
//

#import "WYMainViewController.h"
#import "WYLeftMenu.h"

@interface WYMainViewController ()

@end

@implementation WYMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 1.添加左边菜单
    [self setupLeftMenu];
}
/**
 *  添加左边菜单
 */
- (void)setupLeftMenu
{
    WYLeftMenu *leftMenu = [[WYLeftMenu alloc] init];
    leftMenu.backgroundColor = [UIColor redColor];
    leftMenu.frame = CGRectMake(0, 50, 150, 300);
    [self.view addSubview:leftMenu];
}


@end
