//
//  EditStyleMenu.h
//  TextKitDemo
//
//  Created by jqlv on 2018/3/21.
//  Copyright © 2018年 Max Seelemann. All rights reserved.
//

#import "EditGroupMenu.h"

@interface EditStyleMenu : EditGroupMenu

@property(nonatomic,copy)  void(^selectHandle)(NSInteger index);
@end
