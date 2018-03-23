//
//  JQ_TextAttributeStorage+Json.h
//  JQ_EditDemo
//
//  Created by jqlv on 2018/3/23.
//  Copyright © 2018年 jqlv. All rights reserved.
//

#import "JQ_TextAttributeStorage.h"

@interface JQ_TextAttributeStorage (Json)

-(NSString *)parse;
-(JQ_TextAttributeStorage *)reParse;

@end
