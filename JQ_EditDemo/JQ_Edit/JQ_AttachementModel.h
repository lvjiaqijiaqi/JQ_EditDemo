//
//  JQ_AttachementModel.h
//  JQ_EditDemo
//
//  Created by jqlv on 2018/3/22.
//  Copyright © 2018年 jqlv. All rights reserved.
//

#import "JQ_AttributeModel.h"

@interface JQ_AttachementModel : NSObject<JQ_AttributeModelDelegate>

@property(strong,nonatomic) NSString *imageName;
@property(strong,nonatomic) UIImage *image;

@property(assign,nonatomic) CGSize size;

@property(nonatomic,assign) NSInteger identifer;

@end
