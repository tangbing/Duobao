//
//  DuobaoCollectionViewCell.m
//  Duobao
//
//  Created by Tb on 2016/12/10.
//  Copyright © 2016年 Tb. All rights reserved.
//

#import "DuobaoCollectionViewCell.h"
#import "UIImageView+WebCache.h"
@interface DuobaoCollectionViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *goodsImageView;
@property (weak, nonatomic) IBOutlet UILabel *gNameLabel;
@property (weak, nonatomic) IBOutlet UIButton *onceShopBtn;


@end

@implementation DuobaoCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.onceShopBtn.layer.cornerRadius = 4;
    self.onceShopBtn.layer.borderWidth = 1;
    self.onceShopBtn.layer.borderColor = DuobaoRGBColor(230, 50, 73).CGColor;
    self.onceShopBtn.layer.masksToBounds = YES;
    
    
    
}

//- (void)setFrame:(CGRect)frame
//{
//    frame.size.height -= 1;
//    frame.origin.y += 1;
//    
//    frame.size.width -= 1;
//    frame.origin.x += 1;
//    [super setFrame:frame];
//    
//}

- (void)setList:(NSMutableDictionary *)list{
    _list = list;
    NSDictionary *goods = [list objectForKey:@"goods"];

    DuobaoLog(@"name:%@,url:%@",[goods objectForKey:@"gname"],[goods[@"gpic"] lastObject]);
    self.gNameLabel.text = [goods objectForKey:@"gname"];
    [self.goodsImageView sd_setImageWithURL:[NSURL URLWithString:[goods[@"gpic"] lastObject]] placeholderImage:[UIImage imageNamed:@"good_180x135"]];
}

@end
