//
//  PersonCenterViewController.m
//  NewEDP
//
//  Created by zzs on 15/12/14.
//  Copyright © 2015年 wankang. All rights reserved.
//

// 个人中心

#import "PersonCenterViewController.h"
#import "UIImage+Hexagon.h"
#import "Header.h"
#import "BYSideslipViewController.h"
#import "MenuViewController.h"
#import "TabBarViewController.h"
#import "MyCustomCell.h"
#import "MyExamineCell.h"
#import "PerformanceCell.h"
#import "MyStandardCell.h"
@interface PersonCenterViewController ()<UITableViewDataSource,UITableViewDelegate,UICollectionViewDataSource,UICollectionViewDelegate>
@property(nonatomic,strong)UIImageView * personImageView;
// 客源 业绩 审批
@property (strong, nonatomic) IBOutlet UIView *menuView;
// collectionView
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
// collectionView 的pageControl
@property (weak, nonatomic) IBOutlet UIPageControl *collectionPageControl;
// 公司公告cell
@property (strong, nonatomic) IBOutlet UITableViewCell *bulletinCell;
// 公司业绩cell
@property (strong, nonatomic) IBOutlet UITableViewCell *performanceTableViewCell;
// // 公司业绩cell详情
@property (strong, nonatomic) IBOutlet UITableViewCell *performanceDetail;

@end

@implementation PersonCenterViewController
static NSString * myCustomCell = @"MyCustomCell";
static NSString * myExamineCell = @"MyExamineCell";
static NSString * performanceCell = @"PerformanceCell";
static NSString * myStandardCell = @"MyStandardCell";


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 我的客源cell
    [self.collectionView registerNib:[UINib nibWithNibName:@"MyCustomCell" bundle:nil] forCellWithReuseIdentifier:myCustomCell];
    // 我的待审批
    [self.collectionView registerNib:[UINib nibWithNibName:@"MyExamineCell" bundle:nil] forCellWithReuseIdentifier:myExamineCell];
    // 本月业绩
    [self.collectionView registerNib:[UINib nibWithNibName:@"PerformanceCell" bundle:nil] forCellWithReuseIdentifier:performanceCell];
    // 本月业绩达标率
    [self.collectionView registerNib:[UINib nibWithNibName:@"MyStandardCell" bundle:nil] forCellWithReuseIdentifier:myStandardCell];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)clickMenuButton:(UIButton *)sender {
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 6;
    }
    return 2;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if(section == 0)
    {
        return 187;
    }
    return 2;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        if (indexPath.row == 0 ) {
            return 30;
        }else if (indexPath.row == 3 ) {
            return 5;
        }else{
            return 20;
        }
    }else{
        if (indexPath.row == 0) {
            return 30;
        }else{
            return 150;
        }
    }
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 2;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * cellIdentifier = @"cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (indexPath.section == 0) {
        cell.textLabel.font = [UIFont systemFontOfSize:10];
        if(indexPath.row == 0)
        {
            return self.bulletinCell;
        }else if(indexPath.row == 2){
            cell.textLabel.text = @"[信息技术部]宝原EDP “七剑客” 之 “流程中心” 、 “报表中心” ";
        }else if(indexPath.row == 4) {
            cell.textLabel.text = @"[信息技术部]宝原EDP “七剑客” 之 “人事考勤申请” ";
        }
    }else{
        if (indexPath.row == 0) {
            return  self.performanceTableViewCell;
        }else{
            return self.performanceDetail;
        }
    }
    
    return cell;
}
- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 0) {

        return self.menuView;
    }
    return nil;
}

#pragma mark - UICollectionViewDataSource
//定义展示的Section的个数

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

//定义展示的UICollectionViewCell的个数

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{

    return 8;
}


//每个UICollectionView展示的内容

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.row == 0 || indexPath.row == 4) {
        MyCustomCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:myCustomCell forIndexPath:indexPath];
        return cell;
    }else if (indexPath.row == 1 || indexPath.row == 5)
    {
        PerformanceCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:performanceCell forIndexPath:indexPath];
        return cell;
    }else if (indexPath.row == 2 || indexPath.row == 6)
    {
        MyExamineCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:myExamineCell forIndexPath:indexPath];
        return cell;
    }else{
        MyStandardCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:myStandardCell forIndexPath:indexPath];
        return cell;

    }
  



}

//定义每个UICollectionView 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{

    return CGSizeMake((PL_WIDTH - 45) / 2, 77);
}

//每个section中不同的行之间的行间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 15;
}

//定义每个UICollectionView 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(3, 15, 0,15);
}

//UICollectionView被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"点击了");
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if ([scrollView isKindOfClass:[UICollectionView class]]) {
        // 显示的坐标
        CGPoint offset = scrollView.contentOffset;
        CGRect bounds = scrollView.frame;
        // 设置pageControl显示的位置
        self.collectionPageControl.currentPage = offset.x / bounds.size.width + 0.5;
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
