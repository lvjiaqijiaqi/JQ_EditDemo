//
//  JQ_TextAttributeStorage+Json.m
//  JQ_EditDemo
//
//  Created by jqlv on 2018/3/23.
//  Copyright © 2018年 jqlv. All rights reserved.
//

#import "JQ_TextAttributeStorage+Json.h"

@implementation JQ_TextAttributeStorage (Json)

-(NSString *)parse{
    NSMutableArray<NSDictionary *> *arr =  [NSMutableArray array];
    JQ_TextStorageSegment *segment = self.headSegment;
    while (segment) {
        NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:segment.attributeModel.parseDic];
        dic[@"length"] = [NSNumber numberWithInteger:segment.length];
        [arr addObject:dic];
        segment = segment.next;
    }
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:arr options:NSJSONWritingPrettyPrinted error:nil];
    NSString *string = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return string;
}

-(JQ_TextAttributeStorage *)reParse{
    return nil;
}
@end
