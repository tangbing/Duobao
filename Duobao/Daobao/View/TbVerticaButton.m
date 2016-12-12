//
//  TbVerticaButton.m
//  Duobao
//
//  Created by Tb on 2016/12/8.
//  Copyright © 2016年 Tb. All rights reserved.
//

#define margain 5

#import "TbVerticaButton.h"
@implementation TbVerticaButton

- (void)setup
{
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.font = [UIFont systemFontOfSize:14];
    self.titleLabel.textColor = [UIColor blackColor];
}


- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self setup];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.imageView.centerX = self.width * 0.5;
    self.imageView.y = self.height * 0.2;
    self.imageView.size = self.currentImage.size;
    
    self.titleLabel.y = CGRectGetMaxY(self.imageView.frame) + margain;
    self.titleLabel.centerX = self.width * 0.5;
    [self.titleLabel sizeToFit];
}



@end
