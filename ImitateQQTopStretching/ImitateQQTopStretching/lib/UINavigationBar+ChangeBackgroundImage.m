//
//  UINavigationBar+ChangeBackgroundImage.m
//  ImitateQQTopStretching
//
//  Created by 众力金融 on 2017/9/13.
//  Copyright © 2017年 众力金融. All rights reserved.
//

#import "UINavigationBar+ChangeBackgroundImage.h"

@implementation UINavigationBar (ChangeBackgroundImage)

- (void)hr_star {
    [self setShadowImage:[UIImage new]];
    [self setBackgroundColor:nil];
}

- (void)hr_setBackgroundImage:(UIColor *)color withAlpha:(CGFloat)alpha {
    //当alpha == 1.0f 设置导航为不透明
    if (alpha == 1.0f) {
        self.translucent = NO;
    }else{
        self.translucent = YES;
    }
    //设置一个颜色并转化为图片
    UIImage *image = [self imageWithColor:[color colorWithAlphaComponent:alpha]];
    [self setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
}

- (void)hr_titleColor:(UIColor *)color {
    [self setTitleTextAttributes:@{NSForegroundColorAttributeName:color}];
}

- (void)hr_reset {
    [self setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
}

#pragma mark - Color To Image
- (UIImage *)imageWithColor:(UIColor *)color {
    //创建1像素区域并开始图片绘图
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContext(rect.size);
    
    //创建画板并填充颜色和区域
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    //从画板上获取图片并关闭图片绘图
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
