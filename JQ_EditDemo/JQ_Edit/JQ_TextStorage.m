//
//  JQ_TextStorage.m
//  TextKitDemo
//
//  Created by jqlv on 2018/3/19.
//  Copyright © 2018年 Max Seelemann. All rights reserved.
//

#import "JQ_TextStorage.h"

@interface JQ_TextStorage()

@property(nonatomic,strong) NSMutableAttributedString* imp;

@end

@implementation JQ_TextStorage


- (id)init
{
    self = [super init];
    if (self) {
        _imp = [NSMutableAttributedString new];
    }
    return self;
}
-(BOOL)fixesAttributesLazily{
    return NO;
}

#pragma mark - Reading Text

- (NSString *)string
{
    return _imp.string;
}
- (NSDictionary *)attributesAtIndex:(NSUInteger)location effectiveRange:(NSRangePointer)range
{
    return [_imp attributesAtIndex:location effectiveRange:range];
}
- (void)replaceCharactersInRange:(NSRange)range withString:(NSString *)str
{
    [_imp replaceCharactersInRange:range withString:str];
    [self.textAttributeStorage replaceCharactersInRange:range withString:str];
    [self edited:NSTextStorageEditedCharacters range:range changeInLength:(NSInteger)str.length - (NSInteger)range.length];
}
- (void)setAttributes:(NSDictionary *)attrs range:(NSRange)range
{
    [_imp setAttributes:attrs range:range];
    [self edited:NSTextStorageEditedAttributes range:range changeInLength:0];
}

-(void)processEditing{
    
    [self.textAttributeStorage editAttributeForAttributeStr:self AtRange:self.editedRange];
    [super processEditing];
    
}

@end
