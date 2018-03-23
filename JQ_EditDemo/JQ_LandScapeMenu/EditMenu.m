//
//  EditMenu.m
//  TextKitDemo
//
//  Created by jqlv on 2018/3/21.
//  Copyright © 2018年 Max Seelemann. All rights reserved.
//

#import "EditMenu.h"
#import "EditStyleCollectionViewCell.h"

#define CellEdge 10

@interface EditMenu()
@property(nonatomic,strong) UIButton *leftView;
@end

@implementation EditMenu

-(UIView *)leftView{
    if (!_leftView) {
        UIButton *btm = [UIButton buttonWithType:UIButtonTypeSystem];
        [btm setImage:[UIImage imageNamed:@"pullDownIcon"] forState:UIControlStateNormal];
        btm.contentMode = UIViewContentModeScaleAspectFit;
        btm.frame = CGRectMake(0, 0, 0, 0);
        _leftView = btm;
    }
    return _leftView;
}

-(void)initConponent{
    [super initConponent];
    self.BodyView.backgroundColor = [UIColor whiteColor];
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
    CGFloat height = CGRectGetHeight(self.BodyView.frame) - 2;
    return CGSizeMake(height * 1.5, height);
}
-(CGSize)sectionHeaderSize{
    return CGSizeZero;
}
-(BOOL)sectionPin{
    return YES;
}

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
    return _cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    EditStyleCollectionViewCell * _cell = (EditStyleCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    [_cell didSelect];
    if(self.selectHandle) self.selectHandle(indexPath.row);
}

@end
