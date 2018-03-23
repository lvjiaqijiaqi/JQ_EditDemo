//
//  EditGroupMenu.h
//  TextKitDemo
//
//  Created by jqlv on 2018/3/21.
//  Copyright © 2018年 Max Seelemann. All rights reserved.
//

#import "JQ_LandScapeBaseMenu.h"

@interface EditGroupMenu : JQ_LandScapeBaseMenu

@property(nonatomic,strong) NSArray *menu;
@property(nonatomic,assign) NSInteger selectIdx;

-(void)setTitle:(NSString *)title;

-(void)cancelSelectCell:(UICollectionViewCell *)cell;
-(void)didSelectCell:(UICollectionViewCell *)cell;

@end
