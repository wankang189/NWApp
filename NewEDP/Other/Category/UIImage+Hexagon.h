//
//  UIImage+Hexagon.h
//  NewEDP
//
//  Created by zzs on 15/12/14.
//  Copyright © 2015年 wankang. All rights reserved.
//


//将图片切成六边形返回

#import <UIKit/UIKit.h>

@interface UIImage (Hexagon)
/**
 * 根据指定图片的文件名获取一张圆型的图片对象,并加边框
 * @param name 图片文件名
 * @param borderWidth 边框的宽
 * @param borderColor 边框的颜色
 * @return 切好的圆型图片
 */
+ (UIImage *)hexagonImageWithName:(NSString *)name borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor;

+ (UIImage *)hexagonImageWithImage:(UIImage *)sourceImage borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor;
/**
 * 将一张图片变成指定的大小
 * @param image 原图片
 * @param size 指定的大小
 * @return 指定大小的图片
 */
+ (UIImage *)scaleToSize:(UIImage *)image size:(CGSize)size;



@end
