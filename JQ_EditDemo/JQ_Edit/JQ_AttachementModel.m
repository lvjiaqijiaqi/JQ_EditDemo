//
//  JQ_AttachementModel.m
//  JQ_EditDemo
//
//  Created by jqlv on 2018/3/22.
//  Copyright © 2018年 jqlv. All rights reserved.
//

#import "JQ_AttachementModel.h"

@interface JQ_AttachementModel()

@property(nonatomic,strong) NSTextAttachment *attachment;

@end

@implementation JQ_AttachementModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        static NSInteger identiferStart = 100;
        self.size = CGSizeZero;
        self.image = nil;
        self.imageName = @"";
        self.identifer = identiferStart++;
    }
    return self;
}

- (BOOL)isEqualToAttributeModel:(id<JQ_AttributeModelDelegate>)attributeModel{
    if (self.identifer == attributeModel.identifer) {
        return YES;
    }
    return NO;
}

-(NSTextAttachment *)attachment{
    if (!_attachment) {
        _attachment = [[NSTextAttachment alloc] initWithData:nil ofType:nil];
        _attachment.image = self.image;
        _attachment.bounds = CGRectMake(0, 0, self.size.width, self.size.height);
    }
    return _attachment;
}

-(NSDictionary *)attrDic{
    return @{
             NSAttachmentAttributeName : self.attachment
             };
}

-(NSDictionary *)parseDic{
    return @{
             @"imageName" : self.imageName,
             @"width" : [NSString stringWithFormat:@"%f",self.size.width],
             @"height" : [NSString stringWithFormat:@"%f",self.size.height]
             };
}

-(id<JQ_AttributeModelDelegate>)copyModel{
    JQ_AttachementModel *copyModel =  [[JQ_AttachementModel alloc] init];
    copyModel.size = self.size;
    copyModel.imageName = self.imageName;
    copyModel.image = self.image;
    return copyModel;
}


@end
