//
//  WYRightMenuController.m
//  WYNews
//
//  Created by wangyue on 15/8/30.
//  Copyright (c) 2015年 yanyin. All rights reserved.
//

#import "WYRightMenuController.h"

@interface WYRightMenuController ()
@property (weak, nonatomic) IBOutlet UIButton *login;

@end

@implementation WYRightMenuController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didShow
{
    // 设置登录按钮动画效果
    [UIView transitionWithView:self.login duration:1.0 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
        //设置图片
        [self.login setImage:[UIImage imageNamed:@"user_defaultgift"] forState:UIControlStateNormal];
    } completion:^(BOOL finished) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [UIView transitionWithView:self.login duration:1.0 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
                //还原图片
                [self.login setImage:[UIImage imageNamed:@"default_avatar"] forState:UIControlStateNormal];
            } completion:nil];
        });
        
    }];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
