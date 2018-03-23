//
//  JQ_AttributeModel.m
//  TextKitDemo
//
//  Created by jqlv on 2018/3/15.
//  Copyright © 2018年 Max Seelemann. All rights reserved.
//

#import "JQ_AttributeModel.h"
#import "UIFontDescriptor+JQ_AttributeString.h"
#import "JQ_Config.h"

@interface JQ_AttributeModel()

@property(nonatomic,strong) NSDictionary *attrDic;

@end

@implementation JQ_AttributeModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        static NSInteger identiferStart = 0;
        self.fontColor = @"Black";
        self.backgroundColor = [UIColor whiteColor];
        self.fontSize = 14;
        self.isBold = NO;
        self.isItalic = NO;
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

-(NSDictionary *)attrDic{
    return @{
             NSFontAttributeName:[UIFont fontWithDescriptor:[UIFontDescriptor fontDescriptorNormal] size:self.fontSize],
             NSForegroundColorAttributeName:[[JQ_Config shareInstance] defaultColor:self.fontColor]
             };
}

-(NSDictionary *)parseDic{
    return @{
             @"fontColor" : self.fontColor,
             @"fontSize" : [NSString stringWithFormat:@"%ld",self.fontSize],
             };
}

-(id<JQ_AttributeModelDelegate>)copyModel{
    JQ_AttributeModel *copyModel =  [[JQ_AttributeModel alloc] init];
    copyModel.fontColor = self.fontColor;
    copyModel.fontSize = self.fontSize;
    return copyModel;
}

@end
