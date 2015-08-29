//
//  UIImage+Extension.m
//  WYNews
//
//  Created by wangyue on 15/8/29.
//  Copyright (c) 2015年 yanyin. All rights reserved.
//


#import "UIImage+Extension.h"

@implementation UIImage (Extension)
/**
 *  传入颜色,得到一个该颜色的图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color
{
    // 新图片的尺寸
    CGFloat imageWH = 100;
    // 1.开启基于位图的上下文
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(imageWH, imageWH), NO, 0.0);
    // 2.画矩形
    [color set];
    UIRectFill(CGRectMake(0, 0, imageWH, imageWH));
    // 3.取出图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    // 4.结束上下文
    UIGraphicsEndImageContext();
    
    return image;
    
}
@end
