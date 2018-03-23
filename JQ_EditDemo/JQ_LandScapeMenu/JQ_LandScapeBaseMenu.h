//
//  JQ_LandScapeBaseMenu.h
//  TextKitDemo
//
//  Created by jqlv on 2018/3/21.
//  Copyright © 2018年 Max Seelemann. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JQ_LandScapeBaseMenu : NSObject<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UICollectionViewDelegate>

@property(nonatomic,strong) UIView *view;
@property(nonatomic,strong) UICollectionView *BodyView;
@property(nonatomic,assign) BOOL keepSelectCellInMiddle;
@property(nonatomic,assign) CGRect frame;

-(UIView *)leftView;
-(UIView *)headView;

-(instancetype)initWithFrame:(CGRect)frame;
-(void)initConponent;
-(CGFloat)minimumLineSpacing;
-(CGFloat)minimumInteritemSpacing;
-(UIEdgeInsets)sectionInset;
-(CGSize)itemSize;
-(CGSize)sectionHeaderSize;
-(void)registerReuseClass;
-(BOOL)sectionPin;

@end
