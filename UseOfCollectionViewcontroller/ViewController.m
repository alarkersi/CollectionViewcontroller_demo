//
//  ViewController.m
//  UseOfCollectionViewcontroller
//
//  Created by koGyoko on 2017/06/05.
//  Copyright © 2017年 koGyoko. All rights reserved.
//

#import "ViewController.h"
#import "HeaderReusableView.h"
#import "FooterReusableView.h"
#import "CollectionViewCell.h"

#define DVW [UIScreen mainScreen].bounds.size.width
#define DVH [UIScreen mainScreen].bounds.size.height
@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
{
    UICollectionView *cv;
}
@end
static NSString *cellIdentifier = @"cellId";
static NSString *headerIdentifier = @"reusableView";
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //1.初始化layout
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    //设置collectionView滚动方向
//    [layout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    //设置headerView，footerView的尺寸大小
//    layout.headerReferenceSize = CGSizeMake(DVW, 50);
//    layout.footerReferenceSize = CGSizeMake(DVW, 100);
    //该方法也可以设置itemSize
    layout.itemSize = CGSizeMake(110, 150);
    
    
    //2.初始化collectionView
    cv = [[UICollectionView alloc]initWithFrame:self.view.frame collectionViewLayout:layout];
    [self.view addSubview:cv];
    
    //3.注册collectionViewCell
    [cv registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:cellIdentifier];
    
    [cv registerClass:[HeaderReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerIdentifier];
    
    [cv registerClass:[FooterReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:headerIdentifier];
    cv.delegate = self;
    cv.dataSource = self;
    
    
//    //注册headerView
//    //获取含有UICollectionReusableView的Nib文件。
//    UINib *headerNib = [UINib nibWithNibName:@"HeaderReusableView" bundle:[NSBundle mainBundle]];
//    //注册重用View
//    [cv registerNib:headerNib forCellWithReuseIdentifier:@"HeaderReusableView"];
//    //注册FooterView
//    UINib *footerNib = [UINib nibWithNibName:@"FooterReusableView" bundle:[NSBundle mainBundle]];
//    [cv registerNib:footerNib forCellWithReuseIdentifier:@"FooterReusableView"];
    
}
#pragma mark - collectionView代理方法
//每个section的item个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 9;
}
//返回section个数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 5;
}

//返回cellview，其中 ReuseIdentifier 的值必须和 注册是填写的一致，本例都为 “cellId”
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
//    static NSString *identifier = @"cell";
    CollectionViewCell *cell = (CollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    cell.cellImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld.JPG",(long)indexPath.row]];
    cell.cellLabel.text = [NSString stringWithFormat:@"%ld ,%ld",indexPath.section,indexPath.row];
    cell.backgroundColor = [UIColor yellowColor];
    
    return cell;
}
//通过设置SupplementaryViewOfKind 来设置头部和底部的view，其中 ReuseIdentifier 的值必须和 注册是填写的一致，本例都为 “reusableView”
- (__kindof UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    //设置SectionHeader
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        HeaderReusableView *view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerIdentifier forIndexPath:indexPath];
        
        
        view.headerLabel.text = [NSString stringWithFormat:@"header %ld",indexPath.section];
        view.headerLabel.font = [UIFont systemFontOfSize:20];
        
        return view;
    } else if ([kind isEqualToString:UICollectionElementKindSectionFooter]) {
        FooterReusableView *view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:headerIdentifier forIndexPath:indexPath];
        
        view.footerLabel.text = [NSString stringWithFormat:@"footer %ld",indexPath.section];
        view.footerLabel.font = [UIFont systemFontOfSize:20];
        return view;
    }
    return nil;
}

//设置每个item的尺寸
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return CGSizeMake(90, 130);
}
//设置每个item的UIEdgeInsets
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    
    return UIEdgeInsetsMake(10, 10, 10, 10);
}
//设置每个item垂直间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    
    return 15.0f;
}
//设置每个item水平间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {

    return 10.0f;
}
//设置每个header的尺寸
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return CGSizeMake(DVW, 50);
}
//设置每个footer的尺寸
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
    return CGSizeMake(DVW, 50);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//点击方法
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
   
    
    CollectionViewCell *cell = (CollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    NSString *msg = cell.cellLabel.text;
    NSLog(@"%@",msg);
}
//是否可以高亮
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
//高亮方法
- (void)changeHighlightCellWithIndexPaht: (NSIndexPath *) indexPath {
    
    NSString *imageName = [NSString stringWithFormat:@"%ld.JPG",(long)indexPath.row];
    CollectionViewCell *cell = (CollectionViewCell *)[cv cellForItemAtIndexPath:indexPath];
    
    if (!cell.highlight) {
        imageName = @"30.JPG";
    }
    cell.highlight = !cell.highlight;
    cell.cellImageView.image = [UIImage imageNamed:imageName];
    
    
}
//Cell变为高亮后回调方法
- (void)collectionView:(UICollectionView *)collectionView didHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
//    [self changeHighlightCellWithIndexPaht:indexPath];
    
}

- (void)collectionView:(UICollectionView *)collectionView didUnhighlightItemAtIndexPath:(NSIndexPath *)indexPath {
    [self changeHighlightCellWithIndexPaht:indexPath];
}

@end
