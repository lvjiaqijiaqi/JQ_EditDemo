//
//  JQ_TextAttributeStorage.m
//  JQ_EditDemo
//
//  Created by jqlv on 2018/3/23.
//  Copyright © 2018年 jqlv. All rights reserved.
//

#import "JQ_TextAttributeStorage.h"

@implementation JQ_TextAttributeStorage

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.editAttribute = [[JQ_AttributeModel alloc] init];
        self.headSegment = [[JQ_TextStorageSegment alloc] init];
        self.headSegment.attributeModel = self.editAttribute;
    }
    return self;
}

-(void)replaceCharactersInRange:(NSRange)range withString:(NSString *)string{
    NSInteger length = string.length;
    if (length == 0){//删除
        [self deleteFromRange:range];
    }else if (range.length == 0){//添加
        [self insertAtRange:NSMakeRange(range.location, string.length)];
    }else{//修改
        [self deleteFromRange:range];
        [self insertAtRange:NSMakeRange(range.location, string.length)];
    }
    [self optmizeSegment];
}

-(void)insertAtRange:(NSRange)range{
    NSInteger length = range.length;
    NSInteger startLoc = 0;
    JQ_TextStorageSegment *preSegment = self.headSegment;
    while (startLoc + preSegment.length < range.location) {
        if (!preSegment.next) break;
        startLoc += preSegment.length;
        preSegment = preSegment.next;
    }
    if ([preSegment.attributeModel isEqualToAttributeModel:self.editAttribute]) {
        preSegment.length += length;
    }else{
        [self splitSegment:preSegment AtLoction:range.location - startLoc];
        if (!preSegment) {
            preSegment = self.headSegment;
        }
        JQ_TextStorageSegment *newSegment = [[JQ_TextStorageSegment alloc] init];
        newSegment.attributeModel = self.editAttribute;
        newSegment.length = length;
        [preSegment appendNewSegment:newSegment];
    }
}

-(void)splitSegment:(JQ_TextStorageSegment *)spiltSegment AtLoction:(NSInteger)loc{
    JQ_TextStorageSegment *newSegment =  [[JQ_TextStorageSegment alloc] init];
    newSegment.length = spiltSegment.length - loc;
    spiltSegment.length = loc;
    newSegment.attributeModel = spiltSegment.attributeModel;
    if (newSegment.length != 0) {
        newSegment.next = spiltSegment.next;
        spiltSegment.next = newSegment;
    }
}

-(void)deleteFromRange:(NSRange)range{
    
    NSInteger length = range.length;
    if (!length) return;
    
    JQ_TextStorageSegment *segment = [self attributeSegmentFromIndex:range.location ForStartLoc:nil];
    while (length && segment) {
        length -= [segment deleteLength:length];
        segment = segment.next;
    }
}

-(JQ_TextStorageSegment *)attributeSegmentFromIndex:(NSInteger)index{
    return [self attributeSegmentFromIndex:index ForStartLoc:nil];
}

-(JQ_TextStorageSegment *)attributeSegmentFromIndex:(NSInteger)index ForStartLoc:(NSInteger *)startLoc{
    JQ_TextStorageSegment *segment = self.headSegment;
    NSInteger currentLoc = 0;
    while (YES) {
        if (![segment isEmpty] && index < (currentLoc + segment.length) ) {
            break;
        }
        if (segment.next) {
            currentLoc = currentLoc + segment.length;
            segment = segment.next;
        }else{
            break;
        }
    }
    if (startLoc) {
        *startLoc = currentLoc;
    }
    return segment;
}

-(void)editAttributeForAttributeStr:(NSTextStorage *)attrStr AtRange:(NSRange)range{
    if (range.length == 0) return;
    NSInteger startIdx = range.location;
    NSInteger endIdx = NSMaxRange(range);
    JQ_TextStorageSegment *segmenment = [self attributeSegmentFromIndex:range.location ForStartLoc:&startIdx];
    while (segmenment && startIdx <= endIdx) {
        NSDictionary *dic = segmenment.attributeModel.attrDic;
        [attrStr addAttributes:dic range:NSMakeRange(startIdx, segmenment.length)];
        startIdx += segmenment.length;
        segmenment = segmenment.next;
    }
}
-(void)optmizeSegment{
    JQ_TextStorageSegment *segment = self.headSegment;
    while (segment.next) {
        if ([segment.next isEmpty]) {
            segment.next =  segment.next.next;
        }
        segment = segment.next;
    }
}

@end
