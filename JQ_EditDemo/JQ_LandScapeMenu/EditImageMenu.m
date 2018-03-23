//
//  EditImageMenu.m
//  JQ_EditDemo
//
//  Created by jqlv on 2018/3/23.
//  Copyright © 2018年 jqlv. All rights reserved.
//

#import "EditImageMenu.h"

#import "EditStyleCollectionViewCell.h"

@implementation EditImageMenu

-(UIView *)headView{
    return [[UIView alloc] initWithFrame:CGRectZero];
}

-(void)registerReuseClass{
    [self.BodyView registerClass:[EditStyleCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
}

-(CGFloat)minimumLineSpacing{
    return 2;
}
-(CGFloat)minimumInteritemSpacing{
    return 10000;
}
-(UIEdgeInsets)sectionInset{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}
-(CGSize)itemSize{
    CGFloat height = CGRectGetHeight(self.BodyView.frame) / 2;
    return CGSizeMake(CGRectGetWidth(self.BodyView.frame) / 2, height);
}
-(CGSize)sectionHeaderSize{
    return CGSizeZero;
}
-(BOOL)sectionPin{
    return YES;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.menu.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    EditStyleCollectionViewCell * _cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    [_cell updateImage:self.menu[indexPath.row]];
    if (indexPath.row == self.selectIdx) {
        [_cell didSelect];
    }
    return _cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [super collectionView:collectionView didSelectItemAtIndexPath:indexPath];
    if (self.selectHandle) {
        self.selectHandle(indexPath.row);
    }
}
-(void)cancelSelectCell:(UICollectionViewCell *)cell{
    EditStyleCollectionViewCell * _cell = (EditStyleCollectionViewCell *)cell;
    [_cell cancelSelect];
}

-(void)didSelectCell:(UICollectionViewCell *)cell{
    EditStyleCollectionViewCell * _cell = (EditStyleCollectionViewCell *)cell;
    [_cell didSelect];
}

@end
