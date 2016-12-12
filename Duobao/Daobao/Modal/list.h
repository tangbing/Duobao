//
//  list.h
//  Duobao
//
//  Created by Tb on 2016/12/9.
//  Copyright © 2016年 Tb. All rights reserved.
//

#import <Foundation/Foundation.h>
@class goods;
@interface list : NSObject

//existingTimes	:	366
@property (nonatomic, assign)long existingTimes;
//status	:	1
@property (nonatomic, assign)BOOL status;

//goods		{25}
@property (nonatomic, strong)NSMutableArray* good;

//limitTime	:	0
@property (nonatomic, assign)long limitTime;

//isLimit	:	0
@property (nonatomic, assign)BOOL isLimit;

//listIcons		[0]

//period	:	312090339
@property (nonatomic, assign)long period;

//totalPeriod	:	14960
@property (nonatomic, assign)long totalPeriod;

//isJoined	:	0
@property (nonatomic, assign)BOOL isJoined;


@end
