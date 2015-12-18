//
//  BYSideslipViewController.m
//  NewEDP
//
//  Created by zzs on 15/12/15.
//  Copyright © 2015年 wankang. All rights reserved.
//

#import "BYSideslipViewController.h"
#import "Header.h"
@interface BYSideslipViewController ()<UIGestureRecognizerDelegate>

@end

@implementation BYSideslipViewController
@synthesize speedf,sideslipTapGes;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(instancetype)initWithLeftView:(UIViewController *)LeftView
                  andTabBarView:(UITabBarController*)tabBarView
             andBackgroundImage:(UIImage *)image
{
    if(self){
        speedf = 1;
        
        leftControl = LeftView;
        tabBarControl = tabBarView;
        
        UIImageView * imgview = [[UIImageView alloc]initWithFrame:[UIScreen mainScreen].bounds];
        [imgview setImage:image];
        [self.view addSubview:imgview];
        
        //滑动手势
        UIPanGestureRecognizer * pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(handlePan:)];
        [tabBarView.view addGestureRecognizer:pan];
        
        
        //单击手势
        sideslipTapGes = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handeTap:)];
        [sideslipTapGes setNumberOfTapsRequired:1];
        sideslipTapGes.delegate = self;
        [tabBarControl.view addGestureRecognizer:sideslipTapGes];
        leftControl.view.frame = self.view.frame;
        [self.view addSubview:leftControl.view];
        leftControl.view.backgroundColor = [UIColor redColor];
        [self.view addSubview:tabBarControl.view];
        
    }
    return self;
}

//滑动手势
- (void) handlePan: (UIPanGestureRecognizer *)rec{
    

    CGPoint point = [rec translationInView:self.view];
    
    
    scalef = (point.x*speedf+scalef);
    //根据视图位置判断是左滑还是右边滑动
    if (rec.view.frame.origin.x>0){
        
        rec.view.center = CGPointMake(rec.view.center.x + point.x*speedf,rec.view.center.y);
        rec.view.transform = CGAffineTransformScale(CGAffineTransformIdentity,1.0,1.0);
        [rec setTranslation:CGPointMake(0, 0) inView:self.view];
        
//        leftControl.view.hidden = NO;
        
    }else
    {
        rec.view.transform = CGAffineTransformScale(CGAffineTransformIdentity,1.0,1.0);
        [rec setTranslation:CGPointMake(0, 0) inView:self.view];
        
        
//        leftControl.view.hidden = YES;
    }
    //手势结束后修正位置
    if (rec.state == UIGestureRecognizerStateEnded) {
        if (scalef>140*speedf){
            [self showLeftView];
        }
        else
        {
            [self showtabBarView];
            scalef = 0;
        }
    }
    
}

#pragma mark - 单击手势
-(void)handeTap:(UITapGestureRecognizer *)tap{
    CGPoint point = [tap locationInView:self.view];
    if (tap.state == UIGestureRecognizerStateEnded) {
        if (tabBarControl.view.frame.origin.x == 0) {
            if (0 < point.x && point.x  < 30 && 30 <  point.y && point.y < 65  ) {
                [UIView beginAnimations:nil context:nil];
                tabBarControl.view.transform = CGAffineTransformScale(CGAffineTransformIdentity,1,1);
                tabBarControl.view.center = CGPointMake(PL_WIDTH + PL_WIDTH / 2 - PL_WIDTH / 7 ,PL_HEIGHT / 2);
                [UIView commitAnimations];

            }
        }else{
            [UIView beginAnimations:nil context:nil];
            tap.view.transform = CGAffineTransformScale(CGAffineTransformIdentity,1.0,1.0);
            tap.view.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2,[UIScreen mainScreen].bounds.size.height/2);
            [UIView commitAnimations];
            scalef = 0;
        }
        
    }
}
//恢复位置
-(void)showtabBarView{
    [UIView beginAnimations:nil context:nil];
    tabBarControl.view.transform = CGAffineTransformScale(CGAffineTransformIdentity,1.0,1.0);
    tabBarControl.view.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2,[UIScreen mainScreen].bounds.size.height/2);
    
    [UIView commitAnimations];
}

//显示左视图
-(void)showLeftView{
    [UIView beginAnimations:nil context:nil];
    tabBarControl.view.transform = CGAffineTransformScale(CGAffineTransformIdentity,1,1);
    tabBarControl.view.center = CGPointMake(PL_WIDTH + PL_WIDTH / 2 - PL_WIDTH / 7 ,PL_HEIGHT / 2);
    [UIView commitAnimations];
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:( UITouch *)touch
{
    CGPoint point = [touch locationInView:[touch view]]; //返回触摸点在视图中的当前坐标

    if (tabBarControl.view.frame.origin.x == 0  ) {
        if (0 < point.x && point.x  < 30 && 30 <  point.y && point.y < 65  ) {

            return YES;
        }else{
            return NO;
        }
    }else{
        return YES;
    }
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
