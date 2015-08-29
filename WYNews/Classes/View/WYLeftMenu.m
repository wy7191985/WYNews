//
//  WYLeftMenu.m
//  WYNews
//
//  Created by yanyin on 15/8/27.
//  Copyright (c) 2015年 yanyin. All rights reserved.
//

#import "WYLeftMenu.h"
#import "WYLeftMenuButton.h"

@interface WYLeftMenu ()
/** 当前选中的按钮 */
@property (nonatomic, strong) UIButton *currentSelectedBtn;

@end

@implementation WYLeftMenu

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        CGFloat alpha = 0.2;
        
        //添加按钮
        [self setupButtonWithTitle:@"新闻" imageName:@"sidebar_nav_news" color:WYColorRGBA(202, 68, 73, alpha)];
        [self setupButtonWithTitle:@"订阅" imageName:@"sidebar_nav_reading" color:WYColorRGBA(190, 111, 69, alpha)];
        [self setupButtonWithTitle:@"图片" imageName:@"sidebar_nav_photo" color:WYColorRGBA(76, 132, 190, alpha)];
        [self setupButtonWithTitle:@"视频" imageName:@"sidebar_nav_video" color:WYColorRGBA(101, 170, 78, alpha)];
        [self setupButtonWithTitle:@"跟贴" imageName:@"sidebar_nav_comment" color:WYColorRGBA(170, 172, 73, alpha)];
        [self setupButtonWithTitle:@"电台" imageName:@"sidebar_nav_radio" color:WYColorRGBA(190, 62, 119, alpha)];
    }
    return self;
}

/**
 *  因为创建按钮在设置代理之前,所以在创建按钮init方法里调用点击按钮,无法传值给代理
 */
-(void)setDelegate:(id<WYLeftMenuDelegate>)delegate
{
    _delegate = delegate;
    // 默认选中第一个按钮
    [self btnClick:[self.subviews firstObject]];
}
/**
 *  添加按钮
 */
- (void)setupButtonWithTitle:(NSString *)title imageName:(NSString *)imageName color:(UIColor *)color
{
    WYLeftMenuButton *button = [[WYLeftMenuButton alloc] init];
    [button setTitle:title forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    //高亮时的背景图片(用到了分类生成自定义颜色图片)
    [button setBackgroundImage:[UIImage imageWithColor:color] forState:UIControlStateSelected];
    //设置按钮的tag
    button.tag = self.subviews.count;
    //设置高亮的时候不要让图标变色
    button.adjustsImageWhenHighlighted = NO;
    //设置内容靠左
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    //设置内边距
    button.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    button.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
    //设置监听点击
    [button addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
    
    [self addSubview:button];
}
/**
 *  监听按钮点击
 */
- (void)btnClick:(WYLeftMenuButton *)button
{
    // 判断代理是否实现了代理方法
    if ([self.delegate respondsToSelector:@selector(leftMenu:didClickBtnWithFromIndex:toIndex:)]) {
        [self.delegate leftMenu:self didClickBtnWithFromIndex:self.currentSelectedBtn.tag toIndex:button.tag];
    }
    
    
    // 1.设置当前选中按钮取消选中
    self.currentSelectedBtn.selected = NO;
    // 2.设置点击按钮选中
    button.selected = YES;
    // 3.把点击按钮设置成当前选中按钮
    self.currentSelectedBtn = button;
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
        WYLeftMenuButton *button = self.subviews[i];
        button.width = btnW;
        button.height = btnH;
        button.x = 0;
        button.y = btnH * i;
        
    }
}




@end
