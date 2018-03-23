//
//  EditFontMenu.m
//  TextKitDemo
//
//  Created by jqlv on 2018/3/21.
//  Copyright © 2018年 Max Seelemann. All rights reserved.
//

#import "EditFontMenu.h"
#import "EditFontCollectionViewCell.h"

@implementation EditFontMenu

-(void)initConponent{
    [super initConponent];
    self.BodyView.backgroundColor = [UIColor whiteColor];
}

-(void)registerReuseClass{
    [self.BodyView registerClass:[EditFontCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
}


-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.menu.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    EditFontCollectionViewCell * _cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    [_cell setFontSize:[self.menu[indexPath.row] integerValue]];
    if (indexPath.row == self.selectIdx) {
        [_cell didSelect];
    }
    return _cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [super collectionView:collectionView didSelectItemAtIndexPath:indexPath];
    if (self.selectHandle) {
        self.selectHandle([self.menu[indexPath.row] integerValue]);
    }
}

-(void)cancelSelectCell:(UICollectionViewCell *)cell{
    EditFontCollectionViewCell * _cell = (EditFontCollectionViewCell *)cell;
    [_cell cancelSelect];
}

-(void)didSelectCell:(UICollectionViewCell *)cell{
    EditFontCollectionViewCell * _cell = (EditFontCollectionViewCell *)cell;
    [_cell didSelect];
}

@end
