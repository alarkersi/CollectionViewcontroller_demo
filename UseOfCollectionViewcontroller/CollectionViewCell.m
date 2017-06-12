//
//  CollectionViewCell.m
//  UseOfCollectionViewcontroller
//
//  Created by koGyoko on 2017/06/06.
//  Copyright © 2017年 koGyoko. All rights reserved.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
//    _cellImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 0, 70, 70)];
//    _cellImageView.backgroundColor = [UIColor redColor];
//    
//    [self.contentView addSubview:_cellImageView];
//    
//    _cellLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 80, 70, 30)];
//    _cellLabel.textAlignment = NSTextAlignmentCenter;
//    _cellLabel.textColor = [UIColor blueColor];
//    _cellLabel.font = [UIFont systemFontOfSize:15];
//    _cellLabel.backgroundColor = [UIColor purpleColor];
//    [self.contentView addSubview:_cellLabel];
}

-(instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self)
    {
        _cellImageView  = [[UIImageView alloc] initWithFrame:CGRectMake(10, 0, 70, 70)];
        _cellImageView.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:_cellImageView];
        
        _cellLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 80, 70, 30)];
        _cellLabel.textAlignment = NSTextAlignmentCenter;
        _cellLabel.textColor = [UIColor whiteColor];
        _cellLabel.font = [UIFont systemFontOfSize:15];
        _cellLabel.backgroundColor = [UIColor purpleColor];
        [self.contentView addSubview:_cellLabel];
    }
    
    return self;
}
@end
