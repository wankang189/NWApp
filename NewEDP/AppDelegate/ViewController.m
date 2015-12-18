//
//  ViewController.m
//  NewEDP
//
//  Created by zzs on 15/12/14.
//  Copyright © 2015年 wankang. All rights reserved.
//

#import "ViewController.h"
#import "TabBarViewController.h"
@interface ViewController ()
@property(nonatomic,strong)TabBarViewController * tabBarViewController;
@end

@implementation ViewController
- (TabBarViewController *)tabBarViewController
{
    if (!_tabBarViewController) {
        _tabBarViewController = [[TabBarViewController alloc]init];
    }
    return _tabBarViewController;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tabBarViewController.view];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
