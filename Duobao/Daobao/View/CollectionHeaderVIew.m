//
//  collectionHeaderVIew.m
//  Duobao
//
//  Created by Tb on 2016/12/11.
//  Copyright © 2016年 Tb. All rights reserved.
//

#import "CollectionHeaderVIew.h"

@interface CollectionHeaderVIew()
@property (nonatomic, strong)NSArray *titles;
/**
 *  指示器
 */
@property (nonatomic, weak)UIView *indicatorView;
/**
 *  记录当前选中的按钮
 */
@property (nonatomic, weak) UIButton *selectedButton;

@end

@implementation CollectionHeaderVIew

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
     [self setupUI];
}

- (void)setupUI
{
    [self setupTitleButton];
    [self setupIndicatorView];
}

- (void)setupTitleButton
{
    self.titles = @[@"人气",@"最新",@"进展",@"总需人次"];
    CGFloat buttonW = self.width / self.titles.count;
    CGFloat buttonY = 0;
    CGFloat buttonH = self.height;
    for (int i = 0; i<self.titles.count; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.tag = i;
        button.titleLabel.font = [UIFont systemFontOfSize:15];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setTitle:self.titles[i] forState:UIControlStateNormal];
        if (i == self.titles.count -1) {
            [button setImage:[UIImage imageNamed:@"list_nav_need"] forState:UIControlStateNormal];
            
            [button setImageEdgeInsets:UIEdgeInsetsMake(0, 85, 0, 0)];
        }
        button.frame = CGRectMake(i * buttonW, buttonY, buttonW, buttonH);
        [self addSubview:button];
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        // 默认选中第一个按钮
        if (self.subviews.count == 1) {
            [self buttonClick:button];
        }
    }
}

- (void)setupIndicatorView
{
    // 添加分割线
    UIView *coverView = [[UIView alloc] init];
    coverView.x = 0;
    coverView.y = self.height - 1;
    coverView.width = self.width;
    coverView.height = 1;
    coverView.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:coverView];
    
    // 添加指示器
    UIView *indicatorView = [[UIView alloc] init];
    indicatorView.backgroundColor = [UIColor redColor];
    indicatorView.height = 2;
    indicatorView.width = self.width / [self.titles count];
    indicatorView.y = self.height - indicatorView.height;
    [self addSubview:indicatorView];
    self.indicatorView = indicatorView;
}

- (void)buttonClick:(UIButton *)btn
{
    // 让当前选中的取消选中
    self.selectedButton.selected = NO;
    //让新点击的按钮选中
     btn.selected = YES;
    // 新点击的按钮就成为了当前选中的按钮
    self.selectedButton = btn;
    
    if (btn.tag == self.titles.count - 1)
    {
        [btn setImage:[UIImage imageNamed:@"list_nav_need_aesc"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"list_nav_need_desc"] forState:UIControlStateSelected];
        btn.selected = ! btn.selected;
    }
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
    
    [UIView animateWithDuration:0.25 animations:^{
        self.indicatorView.centerX = btn.centerX;
    }];
}

@end
