//
//  DoubaoViewController.m
//  Duobao
//
//  Created by Tb on 2016/12/8.
//  Copyright © 2016年 Tb. All rights reserved.
//

#import "DoubaoViewController.h"
#import "UIBarButtonItem+XMGExtension.h"
#import "HomeHeaderView.h"
#import "AFNetworking.h"
#import "SVProgressHUD.h"
#import "DuobaoCollectionViewCell.h"
#import "collectionHeaderVIew.h"
@interface DoubaoViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic, strong)NSMutableArray *lists;

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;


@end

@implementation DoubaoViewController

 static NSString* const ID = @"list";
 static NSString* const headerID = @"header";


- (NSMutableArray *)lists
{
    if (!_lists) {
        _lists = [NSMutableArray array];
    }
    return _lists;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupNav];
    
    [self initData];
    
    [self setupCollectionView];
}

- (void)setupNav{
    // 去掉导航栏默认的透明色
     self.navigationController.navigationBar.translucent = NO;
    // 设置导航栏的背景颜色
     self.navigationController.navigationBar.barTintColor = DuobaoRGBColor(203, 69, 85);
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"navbar_search" highImage:nil target:self action:@selector(search)];
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImage:@"common_msg" highImage:nil target:self action:@selector(message)];
    
    UIButton *titleButton = [[UIButton alloc] init];
    titleButton.userInteractionEnabled = NO;
    [titleButton setBackgroundImage:[UIImage imageNamed:@"navbar_title"] forState:UIControlStateNormal];
    titleButton.size = titleButton.currentBackgroundImage.size;
    self.navigationItem.titleView = titleButton;
    
}


- (void)initData
{
    [SVProgressHUD show];
    [[AFHTTPSessionManager manager] GET:@"http://ios.1.163.com/goods/list.do?dbrnd=132130&pageNum=1&pageSize=10&showAll=true&sortId=1&token=4edf8cae-096e-4f00-998f-0a29aef29e27&typeId=0" parameters:nil success:^(NSURLSessionDataTask *task, NSDictionary * responseObject) {
        [SVProgressHUD dismiss];
        DuobaoLog(@"%@",responseObject[@"result"][@"list"]);
        self.lists = responseObject[@"result"][@"list"];
        
       
        [self.collectionView reloadData];
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        [SVProgressHUD showErrorWithStatus:@"网络加载失败"];
    }];
}

- (void)setupCollectionView
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(187, 240);
    CGFloat margain = (self.view.frame.size.width - 2 * layout.itemSize.width) / 2;
    layout.minimumInteritemSpacing = margain;
    layout.minimumLineSpacing = margain;
    
    //代码控制header和footer的显示
    layout.headerReferenceSize = CGSizeMake(self.view.width, 320);

    [self.collectionView setCollectionViewLayout:layout];
    
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([DuobaoCollectionViewCell class]) bundle:nil] forCellWithReuseIdentifier:ID];
    
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([HomeHeaderView class]) bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerID];
    
}

- (void)search
{
    NSLog(@"search");
}

- (void)message
{
    NSLog(@"message");
}

#pragma mark - UICollectionViewDelegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.lists count];
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    DuobaoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    cell.list = self.lists[indexPath.item];
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    CollectionHeaderVIew *headerView = [self.collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:headerID forIndexPath:indexPath];
    if(headerView == nil)
    {
        headerView = [[CollectionHeaderVIew alloc] init];
    }
    return headerView;
}

@end
