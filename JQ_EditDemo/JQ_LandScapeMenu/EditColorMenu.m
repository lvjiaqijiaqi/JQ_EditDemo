//
//  EditColorMenu.m
//  TextKitDemo
//
//  Created by jqlv on 2018/3/21.
//  Copyright © 2018年 Max Seelemann. All rights reserved.
//

#define kRGBColor(r, g, b)    [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define kRGBAColor(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(r)/255.0 blue:(r)/255.0 alpha:a]
#define kRandomColor    KRGBColor(arc4random_uniform(256)/255.0,arc4random_uniform(256)/255.0,arc4random_uniform(256)/255.0)        //随机色生成
#define kColorWithHex(rgbValue) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16)) / 255.0 \
green:((float)((rgbValue & 0xFF00) >> 8)) / 255.0 \
blue:((float)(rgbValue & 0xFF)) / 255.0 alpha:1.0]

#import "EditColorMenu.h"
#import "EditColorCollectionViewCell.h"
#import "JQ_Config.h"

@interface EditColorMenu()

@end

@implementation EditColorMenu

-(void)initConponent{
    [super initConponent];
    self.BodyView.backgroundColor = [UIColor whiteColor];
}
-(void)registerReuseClass{
    [self.BodyView registerClass:[EditColorCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.menu.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    EditColorCollectionViewCell * _cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    [_cell setColor:[[JQ_Config shareInstance] defaultColor:self.menu[indexPath.row]]];
    if (indexPath.row == self.selectIdx) {
        [_cell didSelect];
    }
    return _cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [super collectionView:collectionView didSelectItemAtIndexPath:indexPath];
    if (self.selectHandle) {
        self.selectHandle(self.menu[indexPath.row]);
    }
}
-(void)cancelSelectCell:(UICollectionViewCell *)cell{
    EditColorCollectionViewCell * _cell = (EditColorCollectionViewCell *)cell;
    [_cell cancelSelect];
}

-(void)didSelectCell:(UICollectionViewCell *)cell{
    EditColorCollectionViewCell * _cell = (EditColorCollectionViewCell *)cell;
    [_cell didSelect];
}

@end
