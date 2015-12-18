//
//  LockScreenViewController.m
//  EDP
//
//  Created by heaven on 15/12/15.
//  Copyright © 2015年 Lyy. All rights reserved.
//

#import "LockScreenViewController.h"
#import "LoginViewController.h"
@interface LockScreenViewController ()<UITextFieldDelegate>
//密码输入框
@property (weak, nonatomic) IBOutlet UITextField *textFiled;
//密码图片视图
@property (weak, nonatomic) IBOutlet UIImageView *secretIV;
//位置按钮
@property (weak, nonatomic) IBOutlet UIButton *locationBtn;
//头像视图
@property (weak, nonatomic) IBOutlet UIImageView *iconIV;
//姓名文本
@property (weak, nonatomic) IBOutlet UILabel *nameLab;

//头像上边距约束
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *iconTop;
//姓名文本上边距约束
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *nameTop;
//密码图片上边距约束
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *secretTop;
//密码输入框上边距约束
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *textFieldTop;

@end

@implementation LockScreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.textFiled.delegate = self;
    //给页面添加手势隐藏键盘
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(resignTextField)];
    [self.view addGestureRecognizer:tap];
}

//手势隐藏键盘方法
-(void)resignTextField
{
    [self.textFiled resignFirstResponder];
    if (self.view.bounds.size.width == 320){
        [UIView animateWithDuration:1 animations:^{
            self.nameTop.constant = 30;
            self.iconTop.constant = 80;
            self.secretTop.constant = 60;
            self.textFieldTop.constant = 60;
        }];
    }
}
//忘记密码点击响应方法
- (IBAction)forgetSecret:(id)sender {
    LoginViewController *loginVC = [[LoginViewController alloc]init];
    [self presentViewController:loginVC animated:YES completion:nil];
}

#pragma mark -- UITextField Delegate
//开始编辑
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    //设备是4s和5s时需上移下列视图避免被键盘遮住
    if (self.view.bounds.size.width == 320) {
        [UIView animateWithDuration:1 animations:^{
            self.nameTop.constant = 5;
            self.iconTop.constant = 20;
            self.secretTop.constant = 10;
            self.textFieldTop.constant = 10;
        }];
    }
}
//点击rerurn键隐藏键盘
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    //设备是4s和5s时，键盘退出将各视图移回原位置
    if (self.view.bounds.size.width == 320){
        [UIView animateWithDuration:1 animations:^{
           self.nameTop.constant = 30;
           self.iconTop.constant = 80;
           self.secretTop.constant = 60;
           self.textFieldTop.constant = 60;
        }];
    }
    return YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
