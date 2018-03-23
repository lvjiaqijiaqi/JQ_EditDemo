//
//  EditGroupMenu.m
//  TextKitDemo
//
//  Created by jqlv on 2018/3/21.
//  Copyright © 2018年 Max Seelemann. All rights reserved.
//

#import "EditGroupMenu.h"

#define CellEdge 10

@interface EditGroupMenu()
@property(nonatomic,strong) UILabel *headView;
@end

@implementation EditGroupMenu

-(UIView *)headView{
    if (!_headView) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(CellEdge, 0, CGRectGetWidth(self.view.frame) - CellEdge, 40)];
        label.text = @"";
        label.font = [UIFont systemFontOfSize:12];
        _headView = label;
    }
    return _headView;
}
-(void)setTitle:(NSString *)title{
    self.headView.text = title;
}

-(void)initConponent{
    [super initConponent];
    self.BodyView.backgroundColor = [UIColor whiteColor];
}

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.menu = [NSArray array];
    }
    return self;
}

-(CGFloat)minimumLineSpacing{
    return CellEdge;
}
-(CGFloat)minimumInteritemSpacing{
    return 10000;
}
-(UIEdgeInsets)sectionInset{
    return UIEdgeInsetsMake(0, CellEdge, 0, 0);
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

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (self.keepSelectCellInMiddle) {
        NSArray<NSIndexPath *> *indexs  =  [collectionView indexPathsForVisibleItems];
        
        __block NSInteger minIndex = [indexs firstObject].row;
        [indexs enumerateObjectsUsingBlock:^(NSIndexPath * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if (obj.row < minIndex) {
                minIndex = obj.row;
            }
        }];
        NSInteger middleIndex = indexs.count / 2 + minIndex;
        NSInteger diffIndex = indexPath.row - middleIndex + minIndex;
        if (diffIndex >= 0 && diffIndex < self.menu.count) {
            [collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:diffIndex inSection:0] atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
        }
    }
    [self cancelSelectCell:[collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForRow:self.selectIdx inSection:0]]];
    [self didSelectCell:[collectionView cellForItemAtIndexPath:indexPath]];
    
    self.selectIdx = indexPath.row;
}

-(void)cancelSelectCell:(UICollectionViewCell *)cell{
    
}

-(void)didSelectCell:(UICollectionViewCell *)cell{
    
}

@end
