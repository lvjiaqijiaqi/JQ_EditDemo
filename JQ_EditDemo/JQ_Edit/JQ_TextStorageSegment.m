//
//  JQ_TextStorageSegment.m
//  TextKitDemo
//
//  Created by jqlv on 2018/3/20.
//  Copyright © 2018年 Max Seelemann. All rights reserved.
//

#import "JQ_TextStorageSegment.h"


@implementation JQ_TextStorageSegment

- (instancetype)init
{
    self = [super init];
    if (self) {
        _next = nil;
        _length = 0;
    }
    return self;
}

-(BOOL)isEmpty{
    if (self.length) {
        return NO;
    }
    return YES;
}

-(NSInteger)deleteLength:(NSInteger)length{
    length = self.length - length > 0 ? length : self.length;
    self.length -= length;
    return length;
}

-(void)appendNewSegment:(JQ_TextStorageSegment *)newSegment{
    newSegment.next = self.next;
    self.next = newSegment;
}


@end
