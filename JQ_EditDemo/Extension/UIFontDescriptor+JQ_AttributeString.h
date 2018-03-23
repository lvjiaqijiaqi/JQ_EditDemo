//
//  UIFontDescriptor+JQ_AttributeString.h
//  TextKitDemo
//
//  Created by jqlv on 2018/3/20.
//  Copyright © 2018年 Max Seelemann. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIFontDescriptor (JQ_AttributeString)

+(UIFontDescriptor *)fontDescriptorNormal;
+(UIFontDescriptor *)fontDescriptorBold;
+(UIFontDescriptor *)fontDescriptorItalic;
+(UIFontDescriptor *)fontDescriptorBoldItalic;

@end
