//
//  EditFontMenu.h
//  TextKitDemo
//
//  Created by jqlv on 2018/3/21.
//  Copyright © 2018年 Max Seelemann. All rights reserved.
//

#import "EditGroupMenu.h"

@interface EditFontMenu : EditGroupMenu

@property(nonatomic,copy)  void(^selectHandle)(NSInteger fontSize);

@end
