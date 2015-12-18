//
//  UIImage+Hexagon.m
//  NewEDP
//
//  Created by zzs on 15/12/14.
//  Copyright © 2015年 wankang. All rights reserved.
//

#import "UIImage+Hexagon.h"

@implementation UIImage (Hexagon)
+ (UIImage *)hexagonImageWithName:(NSString *)name borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor
{
    UIImage *sourceImage = [UIImage imageNamed:name];
    return [self hexagonImageWithImage:sourceImage borderWidth:borderWidth borderColor:borderColor];
}

+ (UIImage *)hexagonImageWithImage:(UIImage *)sourceImage borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor
{
    //1. 开启上下文
    CGFloat imageWidth = sourceImage.size.width + 2 * borderWidth;
    CGFloat imageHeigh = sourceImage.size.height + 2 * borderWidth;
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(imageWidth, imageHeigh), NO, 0);
    //2. 获取上下文
    UIGraphicsGetCurrentContext();
    //3. 绘制六边形
    UIBezierPath * bezierPath = [UIBezierPath bezierPath];

    bezierPath.lineCapStyle = kCGLineCapRound;  //线条拐角
    bezierPath.lineJoinStyle = kCGLineCapRound;  //终点处理
    bezierPath.lineWidth = borderWidth;

    
    [bezierPath moveToPoint:CGPointMake(imageWidth / 2, borderWidth)];
    [bezierPath addLineToPoint:CGPointMake(borderWidth, (imageHeigh -  borderWidth) / 180 * 44 + borderWidth )];
    [bezierPath addLineToPoint:CGPointMake(borderWidth, (imageHeigh - borderWidth) / 180 * 136 )];
    [bezierPath addLineToPoint:CGPointMake(imageWidth / 2, (imageHeigh -   borderWidth ))];
    [bezierPath addLineToPoint:CGPointMake((imageWidth - borderWidth), (imageHeigh - borderWidth) / 180 * 136)];
    [bezierPath addLineToPoint:CGPointMake((imageWidth - borderWidth), (imageHeigh -  borderWidth) / 180 * 44 + borderWidth)];
    [bezierPath closePath];


    [borderColor setStroke];
    [bezierPath stroke];
    
  

    //4. 使用BezierPath进行剪切
    [bezierPath addClip];
    //5. 画图
    [sourceImage drawInRect:CGRectMake(borderWidth, borderWidth , sourceImage.size.width, sourceImage.size.height)];
    //6. 从内存中创建新图片对象
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    //7. 结束上下文
    UIGraphicsEndImageContext();
    return newImage;
}
+ (UIImage *)scaleToSize:(UIImage *)image size:(CGSize)size
{
    UIGraphicsBeginImageContext(size);
    [image drawInRect:CGRectMake(0,0,size.width, size.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}
@end
