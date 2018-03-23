//
//  EditStyleMenu.m
//  TextKitDemo
//
//  Created by jqlv on 2018/3/21.
//  Copyright © 2018年 Max Seelemann. All rights reserved.
//

#import "EditStyleMenu.h"
#import "EditStyleCollectionViewCell.h"

@implementation EditStyleMenu

-(void)registerReuseClass{
    [self.BodyView registerClass:[EditStyleCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
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
