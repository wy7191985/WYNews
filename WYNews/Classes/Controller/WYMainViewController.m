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
#import "WYReadingViewController.h"
#import "WYTitleView.h"

#define WYLeftMenuY 50
#define WYLeftMenuW 150
#define WYLeftMenuH 300
#define WYCoverTag 222

@interface WYMainViewController () <WYLeftMenuDelegate>

/** 正在显示的导航栏控制器 */
@property (nonatomic, strong) UINavigationController *showingNavigationController;



@end

@implementation WYMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 1.添加子控制器
    [self setupChildVc];
    // 2.添加左边菜单
    [self setupLeftMenu];
    
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
    // 设置代理
    leftMenu.delegate = self;
    leftMenu.frame = CGRectMake(0, WYLeftMenuY, WYLeftMenuW, WYLeftMenuH);
    [self.view insertSubview:leftMenu atIndex:1];
}
/**
 *  添加子控制器
 */
- (void)setupChildVc
{
    //添加新闻控制器
    WYNewsViewController *newsVc = [[WYNewsViewController alloc] init];
    [self setupVc:newsVc title:@"新闻"];
    //添加订阅
    WYReadingViewController *readVc = [[WYReadingViewController alloc] init];
    [self setupVc:readVc title:@"订阅"];
    UIViewController *photoVc = [[UIViewController alloc] init];
    photoVc.view.backgroundColor = WYRandomColor;
    [self setupVc:photoVc title:@"图片"];
    UIViewController *videoVc = [[UIViewController alloc] init];
    videoVc.view.backgroundColor = WYRandomColor;
    [self setupVc:videoVc title:@"视频"];
    UIViewController *commentVc = [[UIViewController alloc] init];
    commentVc.view.backgroundColor = WYRandomColor;
    [self setupVc:commentVc title:@"跟贴"];
    UIViewController *radioVc = [[UIViewController alloc] init];
    radioVc.view.backgroundColor = WYRandomColor;
    [self setupVc:radioVc title:@"电台"];
}

/**
 *  包装一个导航栏控制器,添加进子控制器数组
 */
- (void)setupVc:(UIViewController *)vc title:(NSString *)titile
{
    WYNavigationController *nav = [[WYNavigationController alloc] initWithRootViewController:vc];
    [self addChildViewController:nav];
    // 设置为当前现实的控制器
    self.showingNavigationController = nav;
    // 添加标题
    WYTitleView *titleView = [[WYTitleView alloc] init];
    titleView.title = titile;
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
            // 给缩放的控制器添加遮盖
            UIButton *cover = [[UIButton alloc] init];
            cover.frame = showingView.bounds;
//            cover.backgroundColor = [UIColor redColor];
            cover.tag = WYCoverTag;
            [showingView addSubview:cover];
            //添加点击事件
            [cover addTarget:self action:@selector(coverClick:) forControlEvents:UIControlEventTouchUpInside];
            
        }];
    }
}
/**
 *  点击了遮盖
 */
- (void)coverClick:(UIButton *)cover
{
    //取出当前现实的控制器view
    UIView *showingView = self.showingNavigationController.view;
    
    [UIView animateWithDuration:0.25 animations:^{
        // 重置
        showingView.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        // 移除遮盖
        [cover removeFromSuperview];
    }];
}

- (void)rightBtnClick
{
    
}

#pragma mark - WYleftMenuDelegate
- (void)leftMenu:(WYLeftMenu *)leftMenu didClickBtnWithFromIndex:(NSUInteger)from toIndex:(NSUInteger)to
{
    // 1.移除旧的控制器的view
    UINavigationController *oldNav = self.childViewControllers[from];
    [oldNav.view removeFromSuperview];
    // 2.添加点击的控制器view
    UINavigationController *newNav = self.childViewControllers[to];
    [self.view addSubview:newNav.view];
    // 3.设置新控制的transform跟旧控制器一样
    newNav.view.transform = oldNav.view.transform;
    // 4.设置当前显示的导航栏控制器
    self.showingNavigationController = newNav;
    // 5.新的控制器重置transform(相当于点击了遮盖)
    [self coverClick:(UIButton *)[newNav.view viewWithTag:WYCoverTag]];
    // 6.给缩放的控制器view添加阴影
    newNav.view.layer.shadowColor = [UIColor blackColor].CGColor;
    newNav.view.layer.shadowOffset = CGSizeMake(-2, 0);
    newNav.view.layer.shadowOpacity = 0.5;
    
    
}
@end
