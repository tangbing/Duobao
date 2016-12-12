//
//  gpic.h
//  Duobao
//
//  Created by Tb on 2016/12/9.
//  Copyright © 2016年 Tb. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface gpic : NSObject
/** 小图片的URL */
@property (nonatomic, copy)NSString * small_image;
/** 中图片的URL */
@property (nonatomic, copy)NSString *middle_image;
/** 大图片的URL */
@property (nonatomic, copy)NSString *large_image;
@end
