
//
//  result.m
//  Duobao
//
//  Created by Tb on 2016/12/10.
//  Copyright © 2016年 Tb. All rights reserved.
//

#import "result.h"
#import "list.h"
@implementation result

//- (NSMutableArray *)lists
//{
//    if (!_lists) {
//        _lists = [NSMutableArray array];
//    }
//    return _lists;
//}

+ (NSDictionary *)objectClassInArray
{
    return @{@"lists" : @"list"};
}
@end
