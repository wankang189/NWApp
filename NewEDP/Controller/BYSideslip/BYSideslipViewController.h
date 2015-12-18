//
//  BYSideslipViewController.h
//  NewEDP
//
//  Created by zzs on 15/12/15.
//  Copyright © 2015年 wankang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BYSideslipViewController : UIViewController{
@private
    UIViewController * leftControl;
    UITabBarController * tabBarControl;
    UIImageView * imgBackground;
    
    CGFloat scalef;
}


//滑动速度系数-建议在0.5-1之间。默认为0.5
@property (assign,nonatomic) CGFloat speedf;

//是否允许点击视图恢复视图位置。默认为yes
@property (strong,nonatomic) UITapGestureRecognizer *sideslipTapGes;

//初始化
-(instancetype)initWithLeftView:(UIViewController *)LeftView
                    andTabBarView:(UITabBarController*)tabBarView
                    andBackgroundImage:(UIImage *)image;

//恢复位置
-(void)showtabBarView;

//显示左视图
-(void)showLeftView;






@end
