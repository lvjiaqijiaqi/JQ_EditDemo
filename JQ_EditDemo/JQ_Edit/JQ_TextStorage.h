//
//  JQ_TextStorage.h
//  TextKitDemo
//
//  Created by jqlv on 2018/3/19.
//  Copyright © 2018年 Max Seelemann. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JQ_TextStorageSegment.h"
#import "JQ_TextAttributeStorage.h"

@interface JQ_TextStorage : NSTextStorage

@property(nonatomic,strong) JQ_TextAttributeStorage *textAttributeStorage;

@end
