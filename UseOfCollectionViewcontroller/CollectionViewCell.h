//
//  CollectionViewCell.h
//  UseOfCollectionViewcontroller
//
//  Created by koGyoko on 2017/06/06.
//  Copyright © 2017年 koGyoko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionViewCell : UICollectionViewCell

@property (strong, nonatomic) UIImageView *cellImageView;
@property (strong, nonatomic) UILabel *cellLabel;
@property BOOL highlight;
@end
