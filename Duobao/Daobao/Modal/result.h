//
//  result.h
//  Duobao
//
//  Created by Tb on 2016/12/10.
//  Copyright © 2016年 Tb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "list.h"
@interface result : NSObject


@property (nonatomic, copy)NSString *name;

@property (nonatomic, assign)NSInteger pageSize;

@property (nonatomic, assign)NSInteger pageNum;

@property (nonatomic, strong)NSArray *lists;

//name	:	其他分类
//
//pageSize	:	10
//
//list		[10]
//
//ver	:	1
//
//totalCnt	:	162
//
//pageNum	:	1

@end
