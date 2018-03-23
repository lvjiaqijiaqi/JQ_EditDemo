//
//  EditMenu.h
//  TextKitDemo
//
//  Created by jqlv on 2018/3/21.
//  Copyright © 2018年 Max Seelemann. All rights reserved.
//

#import "JQ_LandScapeBaseMenu.h"

@interface EditMenu : JQ_LandScapeBaseMenu

@property(nonatomic,strong) NSArray *menu;
@property(nonatomic,copy)  void(^selectHandle)(NSInteger index);

@end
