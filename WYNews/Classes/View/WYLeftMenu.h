//
//  WYLeftMenu.h
//  WYNews
//
//  Created by yanyin on 15/8/27.
//  Copyright (c) 2015年 yanyin. All rights reserved.
//  左边菜单

#import <UIKit/UIKit.h>
@class WYLeftMenu;
@protocol WYLeftMenuDelegate <NSObject>

@optional
- (void)leftMenu:(WYLeftMenu *)leftMenu didClickBtnWithFromIndex:(NSUInteger)from toIndex:(NSUInteger)to;

@end

@interface WYLeftMenu : UIView
@property (nonatomic, weak) id<WYLeftMenuDelegate> delegate;

@end
