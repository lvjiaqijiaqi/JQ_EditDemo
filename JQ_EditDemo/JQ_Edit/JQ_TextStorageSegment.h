//
//  JQ_TextStorageSegment.h
//  TextKitDemo
//
//  Created by jqlv on 2018/3/20.
//  Copyright © 2018年 Max Seelemann. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JQ_AttributeModel.h"

@interface JQ_TextStorageSegment : NSObject

@property(nonatomic,strong) JQ_TextStorageSegment *next;
@property(nonatomic,assign) NSInteger length;

@property(nonatomic,strong) id<JQ_AttributeModelDelegate> attributeModel;

-(BOOL)isEmpty;
-(NSInteger)deleteLength:(NSInteger)length;
-(void)appendNewSegment:(JQ_TextStorageSegment *)newSegment;

@end
