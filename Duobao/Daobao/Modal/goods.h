//
//  goods.h
//  Duobao
//
//  Created by Tb on 2016/12/9.
//  Copyright © 2016年 Tb. All rights reserved.
//

#import <Foundation/Foundation.h>
@class gpic;

@interface goods : NSObject

@property (nonatomic, copy)NSString* desc;

@property (nonatomic, copy)NSString *gname;

@property (nonatomic, assign)long totalPrice;

@property (nonatomic, assign)long totalTimes;

@property (nonatomic, strong)NSArray* pictureUrl;

@end
