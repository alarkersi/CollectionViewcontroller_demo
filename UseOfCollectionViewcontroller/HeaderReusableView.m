//
//  HeaderReusableView.m
//  UseOfCollectionViewcontroller
//
//  Created by koGyoko on 2017/06/05.
//  Copyright © 2017年 koGyoko. All rights reserved.
//

#import "HeaderReusableView.h"

@implementation HeaderReusableView

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code

}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self){
        _headerLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
    
        self.backgroundColor = [UIColor grayColor];
        [self addSubview:_headerLabel];
    }
    return self;
}

@end
