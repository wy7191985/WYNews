//
//  WYMainViewController.m
//  WYNews
//
//  Created by yanyin on 15/8/27.
//  Copyright (c) 2015年 yanyin. All rights reserved.
//

#import "WYMainViewController.h"
#import "WYLeftMenu.h"
#import "WYNavigationController.h"
#import "WYNewsViewController.h"

@interface WYMainViewController ()

@end

@implementation WYMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 1.添加左边菜单
    [self setupLeftMenu];
    // 2.添加子控制器
    [self setupChildVc];
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
/**
 *  添加子控制器
 */
- (void)setupChildVc
{
    WYNewsViewController *vc = [[WYNewsViewController alloc] init];
    WYNavigationController *nav = [[WYNavigationController alloc] initWithRootViewController:vc];
    [self.view addSubview:nav.view];
    [self addChildViewController:nav];
    // 添加标题
    UIButton *button = [[UIButton alloc] init];
    [button setTitle:@"新闻" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"navbar_netease"] forState:UIControlStateNormal];
    button.width = 300;
    button.height = 30;
    button.userInteractionEnabled = NO;
    vc.navigationItem.titleView = button;
    
    
    
    
}
@end
