//
//  TabBarViewController.m
//  NewEDP
//
//  Created by zzs on 15/12/14.
//  Copyright © 2015年 wankang. All rights reserved.
//

#import "TabBarViewController.h"
#import "PersonCenterViewController.h"
#import "HomeManagerViewController.h"
#import "CustomerCenterViewController.h"
#import "ProcessCenterViewController.h"
#import "MoreViewController.h"

//颜色自定义
#define COLOR_RGBA(r,g,b,a)  [UIColor colorWithRed:(float)r/255.0f green:(float)g/255.0f blue:(float)b/255.0f alpha:a]

@interface TabBarViewController ()
// 个人中心
@property(nonatomic,strong)PersonCenterViewController * personCenterVC;
// 房源管理
@property(nonatomic,strong)HomeManagerViewController * homeManagerVC;
// 客源中心
@property(nonatomic,strong)CustomerCenterViewController * customerCenterVC;
// 流程中心
@property(nonatomic,strong)ProcessCenterViewController * processCenterVC;
// 更多
@property(nonatomic,strong)MoreViewController * moreVC;

@end

@implementation TabBarViewController
- (PersonCenterViewController *)personCenterVC
{
    if (!_personCenterVC) {
        _personCenterVC = [[PersonCenterViewController alloc]initWithNibName:@"PersonCenterViewController" bundle:nil];
    }
    return _personCenterVC;
}

- (HomeManagerViewController *)homeManagerVC
{
    if (!_homeManagerVC) {
        _homeManagerVC = [[HomeManagerViewController alloc]initWithNibName:@"HomeManagerViewController" bundle:nil];
    }
    return _homeManagerVC;
}

- (CustomerCenterViewController *)customerCenterVC
{
    if (!_customerCenterVC) {
        _customerCenterVC = [[CustomerCenterViewController alloc]initWithNibName:@"CustomerCenterViewController" bundle:nil];
    }
    return _customerCenterVC;
}
- (ProcessCenterViewController *)processCenterVC
{
    if (!_processCenterVC) {
        _processCenterVC = [[ProcessCenterViewController alloc]initWithNibName:@"ProcessCenterViewController" bundle:nil];
    }
    return _processCenterVC;
}
- (MoreViewController *)moreVC
{
    if (!_moreVC) {
        _moreVC = [[MoreViewController alloc]initWithNibName:@"MoreViewController" bundle:nil];
    }
    return _moreVC;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addTabBarVC:self.personCenterVC title:@"个人中心" imageName:@"个人中心-未选中" selectedImageName:@"个人中心-选中"];
    [self addTabBarVC:self.homeManagerVC title:@"房源管理" imageName:@"房源管理-未选中" selectedImageName:@"房源管理-选中"];
    [self addTabBarVC:self.customerCenterVC title:@"客源管理" imageName:@"客源管理-未选中" selectedImageName:@"客源管理-选中"];
    [self addTabBarVC:self.processCenterVC title:@"流程中心" imageName:@"流程中心-未选中" selectedImageName:@"流程中心-选中"];
    [self addTabBarVC:self.moreVC title:@"更多" imageName:@"更多-未选中" selectedImageName:@"更多-选中"];

    
    
    //底部线条
    UIImageView *imageFoot = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Line"]];
    imageFoot.backgroundColor = [UIColor grayColor];
    imageFoot.frame = CGRectMake(0,-1, self.view.frame.size.width, 1);
    [self.tabBar addSubview:imageFoot];



    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 设置tabBar 图片和标题
- (void)addTabBarVC:(UIViewController*)VC title:(NSString*)title imageName:(NSString*)imageName selectedImageName:(NSString *)selectedImageName
{
    // 添加导航栏
    UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:VC];
    // 设置title
    VC.title = title;
    // 设置导航栏的背景颜色
    nav.navigationBar.barTintColor = [UIColor redColor];
    // 设置title的字体颜色
    nav.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor], NSFontAttributeName:[UIFont systemFontOfSize:18]};
    //设置项的文字为白色
    [[UITabBarItem appearance] setTitleTextAttributes:@{
                                                        NSForegroundColorAttributeName:[UIColor grayColor],NSFontAttributeName:[UIFont systemFontOfSize:11]
                                                        } forState:UIControlStateNormal];
    
//    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:COLOR_RGBA(231, 56, 13, 1),NSFontAttributeName:[UIFont systemFontOfSize:11]} forState:UIControlStateSelected];
    //顶部线条
    UIImageView *imageHeader = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Line"]];
    imageHeader.frame = CGRectMake(0,nav.navigationBar.frame.size.height, self.view.frame.size.width, 1);
    [nav.navigationBar addSubview:imageHeader];
    // 设置图标
    VC.tabBarItem.image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    // 设置选中的图标
    VC.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    VC.tabBarItem.imageInsets = UIEdgeInsetsMake(11, 0, -11, 0) ;
    
       // 添加nav
    [self addChildViewController:nav];
    
    
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
