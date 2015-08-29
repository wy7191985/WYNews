//
//  UIImage+Extension.h
//  WYNews
//
//  Created by wangyue on 15/8/29.
//  Copyright (c) 2015年 yanyin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extension)
/**
 *  传入颜色,得到该颜色的image
 */
+ (UIImage *)imageWithColor:(UIColor *)color;
@end
