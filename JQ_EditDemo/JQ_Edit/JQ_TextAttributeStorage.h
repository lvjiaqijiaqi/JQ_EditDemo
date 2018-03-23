//
//  JQ_TextAttributeStorage.h
//  JQ_EditDemo
//
//  Created by jqlv on 2018/3/23.
//  Copyright © 2018年 jqlv. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JQ_TextStorageSegment.h"
#import "JQ_AttributeModel.h"

@interface JQ_TextAttributeStorage : NSObject

@property(nonatomic,strong) JQ_TextStorageSegment *headSegment;
@property(nonatomic,strong) id<JQ_AttributeModelDelegate> editAttribute;

-(void)replaceCharactersInRange:(NSRange)range withString:(NSString *)string;
-(void)editAttributeForAttributeStr:(NSTextStorage *)attrStr AtRange:(NSRange)range;

@end
