//
//  JQ_AttributeModel.h
//  TextKitDemo
//
//  Created by jqlv on 2018/3/15.
//  Copyright © 2018年 Max Seelemann. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol JQ_AttributeModelDelegate

- (BOOL)isEqualToAttributeModel:(id<JQ_AttributeModelDelegate>)attributeModel;

-(NSDictionary *)attrDic;
-(id<JQ_AttributeModelDelegate>)copyModel;
-(NSInteger)identifer;
-(NSDictionary *)parseDic;

@end


@interface JQ_AttributeModel : NSObject<JQ_AttributeModelDelegate>

@property(nonatomic,assign) BOOL isItalic;
@property(nonatomic,assign) BOOL isBold;

@property(nonatomic,assign) NSInteger fontSize;

@property(nonatomic,strong) NSString *fontColor;
@property(nonatomic,strong) UIColor *backgroundColor;

@property(nonatomic,assign) NSInteger identifer;

@end
