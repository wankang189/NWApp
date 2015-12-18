//
//  LoginViewController.m
//  EDP
//
//  Created by heaven on 15/12/14.
//  Copyright © 2015年 Lyy. All rights reserved.
//

#import "LoginViewController.h"
#import "MenuViewController.h"
#import "BYSideslipViewController.h"
#import "TabBarViewController.h"
#import "MenuViewController.h"

@interface LoginViewController ()<UITextFieldDelegate>
//大背景图片视图
@property (weak, nonatomic) IBOutlet UIImageView *bgImageView;
//用户名密码输入视图
@property (weak, nonatomic) IBOutlet UIView *inputView;
//登录按钮
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
//logo图片视图
@property (weak, nonatomic) IBOutlet UIImageView *logoImageV;
//忘记密码按钮
@property (weak, nonatomic) IBOutlet UIButton *forgetSecretBtn;
//修改密码按钮
@property (weak, nonatomic) IBOutlet UIButton *modifySecretBtn;
//用户名文本输入框
@property (weak, nonatomic) IBOutlet UITextField *userNamTextField;
//忘记密码文本输入框
@property (weak, nonatomic) IBOutlet UITextField *secretTextField;
//联系我们按钮
@property (weak, nonatomic) IBOutlet UIButton *contactUsBtn;
//反馈意见按钮
@property (weak, nonatomic) IBOutlet UIButton *feedBackBtn;

//logo顶部约束
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *logoImageTop;
//logo高度
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *logoH;
//logo宽度
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *logoW;
//输入视图上边距约束
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *inputViewTop;

//登录按钮上边距约束
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *loginBtnTop;
//忘记密码按钮上边距约束
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *forgetBtnTop;
//联系我们上边距约束
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *contactUsTop;
//输入视图中密码图片视图上边距约束
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *secretIVTop;
//输入视图高度
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *inputViewH;
//忘记密码文本输入框上边距约束
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *secretTextfieldTop;


@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.hidesBottomBarWhenPushed = YES;
    self.userNamTextField.delegate = self;
    self.secretTextField.delegate = self;
    //给页面添加手势隐藏键盘
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(resignTextField)];
    [self.view addGestureRecognizer:tap];
}

//手势隐藏键盘方法
-(void)resignTextField
{
    [self.userNamTextField resignFirstResponder];
    [self.secretTextField resignFirstResponder];
    [UIView animateWithDuration:1 animations:^{
        self.logoImageTop.constant = 60;
        self.logoW.constant = 100;
        self.logoH.constant = 110;
        self.forgetBtnTop.constant = 190;
        self.inputViewTop.constant = 5;
        self.loginBtnTop.constant = 30;
        self.contactUsTop.constant = 20;
    }];
}

#pragma mark -- UITextField Delegate
//开始编辑
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    NSLog(@"editing");
    [UIView animateWithDuration:1 animations:^{
        self.logoImageTop.constant = 30;
        self.logoW.constant = 50;
        self.logoH.constant = 60;
        self.forgetBtnTop.constant = 100;
        self.inputViewTop.constant = 0;
        self.loginBtnTop.constant = 10;
        self.contactUsTop.constant = 5;
    }];
    
}

//点击rerurn键隐藏键盘
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    [UIView animateWithDuration:1 animations:^{
        self.logoImageTop.constant = 60;
        self.logoW.constant = 100;
        self.logoH.constant = 110;
        self.forgetBtnTop.constant = 190;
        self.inputViewTop.constant = 5;
        self.loginBtnTop.constant = 30;
        self.contactUsTop.constant = 20;
    }];
    return YES;
}

//登录按钮点击响应方法
- (IBAction)loginBtnAction:(UIButton *)sender {
    if ([self.userNamTextField.text isEqualToString:@""]||[self.secretTextField.text isEqualToString:@""]) {
        
    }
        MenuViewController * menuView = [[MenuViewController alloc]initWithNibName:@"MenuViewController" bundle:nil];
    
        TabBarViewController * tabBarControl = [[TabBarViewController alloc]init];
    
        BYSideslipViewController * slide = [[BYSideslipViewController alloc]initWithLeftView:menuView andTabBarView:tabBarControl andBackgroundImage:nil];
        slide.speedf = 0.5;
        slide.sideslipTapGes.enabled = YES;
    [self presentViewController:slide animated:YES completion:nil];
    
}

//忘记密码按钮点击响应方法
- (IBAction)forgetSecret:(UIButton *)sender {
    NSLog(@"忘记密码");
}

//修改密码按钮点击响应方法
- (IBAction)modifySecret:(UIButton *)sender {
    NSLog(@"修改密码");
}
//联系我们按钮点击响应方法
- (IBAction)contactUs:(UIButton *)sender {
    NSLog(@"联系我们");
}
//反馈意见按钮点击响应方法
- (IBAction)feedback:(UIButton *)sender {
    NSLog(@"反馈意见");
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
