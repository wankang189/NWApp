//
//  MenuViewController.m
//  EDP
//
//  Created by heaven on 15/12/14.
//  Copyright © 2015年 Lyy. All rights reserved.
//

#import "MenuViewController.h"
#import "MenuCell.h"
#import "LockScreenViewController.h"
#import "LoginViewController.h"
#import "Header.h"
@interface MenuViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
//菜单视图右边距
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *rightEdgeDistance;

@end

@implementation MenuViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.rightEdgeDistance.constant = PL_WIDTH / 7;

    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.scrollEnabled = NO;
}

#pragma mark UITableView delegate & datasource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"menu";
    MenuCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"MenuCell" owner:self options:nil] lastObject];
    }
    cell.button.userInteractionEnabled = NO;
    if (indexPath.row == 0) {
        [cell.button setImage:[UIImage imageNamed:@"个人设置"] forState:UIControlStateNormal];
        [cell.button setTitle:@"个人设置" forState:UIControlStateNormal];
    }
    else if (indexPath.row == 1){
        [cell.button setImage:[UIImage imageNamed:@"设置座席"] forState:UIControlStateNormal];
        [cell.button setTitle:@"设置座席" forState:UIControlStateNormal];
    }
    else if (indexPath.row == 2){
        [cell.button setImage:[UIImage imageNamed:@"系统帮助"] forState:UIControlStateNormal];
        [cell.button setTitle:@"系统帮助" forState:UIControlStateNormal];
    }
    else if (indexPath.row == 3){
        [cell.button setImage:[UIImage imageNamed:@"系统设置"] forState:UIControlStateNormal];
        [cell.button setTitle:@"系统设置" forState:UIControlStateNormal];
    }
    cell.selectionStyle = UITableViewCellEditingStyleNone;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"click");
}

//锁屏按钮点击事件方法
- (IBAction)lockScreen:(id)sender {
    LockScreenViewController *lockVC = [[LockScreenViewController alloc]init];
    [self presentViewController:lockVC animated:YES completion:nil];
}

//注销按钮点击事件方法
- (IBAction)logOff:(UIButton *)sender {
    LoginViewController *loginVC = [[LoginViewController alloc]init];
    [self presentViewController:loginVC animated:YES completion:nil];}

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
