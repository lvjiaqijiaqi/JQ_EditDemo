//
//  EditImageMenu.h
//  JQ_EditDemo
//
//  Created by jqlv on 2018/3/23.
//  Copyright © 2018年 jqlv. All rights reserved.
//

#import "EditGroupMenu.h"

@interface EditImageMenu : EditGroupMenu

@property(nonatomic,copy)  void(^selectHandle)(NSInteger index);

@end
