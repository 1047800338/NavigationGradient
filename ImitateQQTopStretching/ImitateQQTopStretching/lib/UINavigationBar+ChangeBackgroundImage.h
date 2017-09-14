//
//  UINavigationBar+ChangeBackgroundImage.h
//  ImitateQQTopStretching
//
//  Created by 众力金融 on 2017/9/13.
//  Copyright © 2017年 众力金融. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationBar (ChangeBackgroundImage)

/**
 *  隐藏导航栏下的横线，背景色置空
 */
- (void)hr_star;

/**
 设置UINavigationBar 背景图片
 
 @param color 用颜色生成image
 @param alpha 透明度
 */
- (void)hr_setBackgroundImage:(UIColor *)color withAlpha:(CGFloat)alpha;

/**
 *  还原导航栏
 */
- (void)hr_reset;

/**
 *  设置标题颜色
 */
- (void)hr_titleColor:(UIColor *)color;



@end
