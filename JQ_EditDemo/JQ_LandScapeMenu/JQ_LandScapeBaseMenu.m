//
//  JQ_LandScapeBaseMenu.m
//  TextKitDemo
//
//  Created by jqlv on 2018/3/21.
//  Copyright © 2018年 Max Seelemann. All rights reserved.
//

#import "JQ_LandScapeBaseMenu.h"


@interface JQ_LandScapeBaseMenu()
@property(nonatomic,strong) UICollectionViewFlowLayout *layout;
@end

@implementation JQ_LandScapeBaseMenu

-(UIView *)leftView{return [[UIView alloc] init];}
-(UIView *)headView{return [[UIView alloc] init];}

-(void)initConponent{
    
    [self.view addSubview:self.headView];
    [self.view addSubview:self.leftView];
    self.layout = [[UICollectionViewFlowLayout alloc] init];
    self.BodyView = [[UICollectionView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.leftView.frame), CGRectGetMaxY(self.headView.frame), CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame) - CGRectGetHeight(self.headView.frame)) collectionViewLayout:self.layout];
    self.BodyView.bounces = NO;
    self.BodyView.bouncesZoom = NO;
    self.BodyView.showsVerticalScrollIndicator = NO;
    self.BodyView.showsHorizontalScrollIndicator = NO;
    self.BodyView.delegate = self;
    self.BodyView.dataSource = self;
    [self configLayout:self.layout];
    [self registerReuseClass];
    
    [self.view addSubview:self.BodyView];
}

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super init];
    if (self) {
        self.view = [[UIView alloc] initWithFrame:frame];
        self.keepSelectCellInMiddle  = YES;
        [self initConponent];
    }
    return self;
}

-(void)configLayout:(UICollectionViewFlowLayout *)layout{
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.itemSize = [self itemSize];
    [layout setSectionHeadersPinToVisibleBounds:[self sectionPin]];
    [layout setHeaderReferenceSize:[self sectionHeaderSize]];
    layout.sectionInset = [self sectionInset];
    layout.minimumLineSpacing = [self minimumLineSpacing];
    layout.minimumInteritemSpacing = [self minimumInteritemSpacing];
}

-(CGFloat)minimumLineSpacing{
    return 0;
}
-(CGFloat)minimumInteritemSpacing{
    return 10000;
}
-(UIEdgeInsets)sectionInset{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}
-(CGSize)itemSize{
    return CGSizeZero;
}
-(CGSize)sectionHeaderSize{
    return CGSizeZero;
}
-(void)registerReuseClass{
    [self.BodyView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
}
-(BOOL)sectionPin{
    return YES;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 0;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 0;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell * _cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    return _cell;
}


@end
