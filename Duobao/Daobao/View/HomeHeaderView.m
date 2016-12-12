
//
//  HomeHeaderView.m
//  Duobao
//
//  Created by Tb on 2016/12/8.
//  Copyright © 2016年 Tb. All rights reserved.
//

#import "HomeHeaderView.h"

@implementation HomeHeaderView

+ (instancetype)headerView
{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:NSMetadataUbiquitousItemURLInLocalContainerKey options:nil] firstObject];
}

@end
