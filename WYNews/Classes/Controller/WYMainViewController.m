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
#import "WYTitleView.h"

#define WYLeftMenuY 50
#define WYLeftMenuW 150
#define WYLeftMenuH 300

@interface WYMainViewController ()

/** 正在显示的导航栏控制器 */
@property (nonatomic, strong) UINavigationController *showingNavigationController;



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
 *  设置状态栏风格(白色)
 */
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}
/**
 *  添加左边菜单
 */
- (void)setupLeftMenu
{
    WYLeftMenu *leftMenu = [[WYLeftMenu alloc] init];
//    leftMenu.backgroundColor = [UIColor redColor];
    leftMenu.frame = CGRectMake(0, WYLeftMenuY, WYLeftMenuW, WYLeftMenuH);
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
    // 设置为当前现实的控制器
    self.showingNavigationController = nav;
    // 添加标题
    WYTitleView *titleView = [[WYTitleView alloc] init];
    titleView.title = @"新闻";
    vc.navigationItem.titleView = titleView;
    // 添加左右按钮
    vc.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImageNamed:@"top_navigation_menuicon" target:self action:@selector(leftBtnClick)];
    vc.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImageNamed:@"top_navigation_infoicon" target:self action:@selector(rightBtnClick)];
}
/**
 *  点击左按钮,向右侧滑,显示左菜单
 */
- (void)leftBtnClick
{
    //取出当前现实的控制器view
    UIView *showingView = self.showingNavigationController.view;
    
    CGFloat ScreenW = [UIScreen mainScreen].bounds.size.width;
    CGFloat ScreenH = [UIScreen mainScreen].bounds.size.height;
    // 1.计算缩放比例
    //缩放后控制器View的高
    CGFloat navH = ScreenH - WYLeftMenuY * 2;
    //缩放比例
    CGFloat scale = navH / ScreenH;
    // 2.计算平移的距离
    //先缩放控制器View到中间两边空出的间距
    CGFloat leftMargin = (ScreenW - (ScreenW * scale)) / 2;
    //向右平移的距离
    CGFloat translateX = WYLeftMenuW - leftMargin;
    //顶部空出的距离
    CGFloat topMargin = (ScreenH - (ScreenH * scale)) / 2;
    //向下平移的距离
    CGFloat translateY = WYLeftMenuY - topMargin;
    
    // 3.缩放
    CGAffineTransform scaleform = CGAffineTransformMakeScale(scale, scale);
    // 4.右移(平移属性被乘上了缩放属性,所以要除回来 )
    CGAffineTransform translateform = CGAffineTransformTranslate(scaleform, translateX / scale, translateY / scale);
    
    
    if (CGAffineTransformIsIdentity(showingView.transform)) { //是否为单倍矩阵
        [UIView animateWithDuration:0.25 animations:^{
            showingView.transform = translateform;
        } completion:^(BOOL finished) {
            
        }];
    } else { // 重置
        [UIView animateWithDuration:0.25 animations:^{
            showingView.transform = CGAffineTransformIdentity;
        }];
        
    }
    
    
    
    
    
    
    
}
- (void)rightBtnClick
{
    
}
@end
