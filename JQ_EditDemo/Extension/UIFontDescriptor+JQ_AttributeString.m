//
//  UIFontDescriptor+JQ_AttributeString.m
//  TextKitDemo
//
//  Created by jqlv on 2018/3/20.
//  Copyright © 2018年 Max Seelemann. All rights reserved.
//

#import "UIFontDescriptor+JQ_AttributeString.h"

#define defaultFontSize 14

@implementation UIFontDescriptor (JQ_AttributeString)

+(UIFontDescriptor *)fontDescriptorNormal{
    UIFont *font = [UIFont systemFontOfSize:defaultFontSize];
    UIFontDescriptor *attributeFontDescriptor = [UIFontDescriptor fontDescriptorWithFontAttributes:
                                                 @{UIFontDescriptorFamilyAttribute: font.familyName,
                                                   UIFontDescriptorSizeAttribute: [NSNumber numberWithFloat:defaultFontSize]}];
    return attributeFontDescriptor;
    
}

+(UIFontDescriptor *)fontDescriptorBold{
    UIFont *font = [UIFont systemFontOfSize:defaultFontSize];
    UIFontDescriptor *attributeFontDescriptor = [UIFontDescriptor fontDescriptorWithFontAttributes:
                                                 @{UIFontDescriptorFamilyAttribute: font.familyName,
                                                   UIFontDescriptorSizeAttribute: [NSNumber numberWithFloat:defaultFontSize]}];
    attributeFontDescriptor = [attributeFontDescriptor fontDescriptorWithSymbolicTraits:UIFontDescriptorTraitBold];
    return attributeFontDescriptor;
    
}
+(UIFontDescriptor *)fontDescriptorItalic{
    UIFont *font = [UIFont systemFontOfSize:defaultFontSize];
    CGAffineTransform matrix = CGAffineTransformMake(1, 0, tanf(15 * (CGFloat)M_PI / 180), 1, 0, 0);
    UIFontDescriptor *attributeFontDescriptor = [UIFontDescriptor fontDescriptorWithFontAttributes:
                                                 @{UIFontDescriptorFamilyAttribute: font.familyName,
                                                   UIFontDescriptorSizeAttribute: [NSNumber numberWithFloat:defaultFontSize]}];
    attributeFontDescriptor = [attributeFontDescriptor fontDescriptorWithMatrix:matrix];
    return attributeFontDescriptor;
}
+(UIFontDescriptor *)fontDescriptorBoldItalic{
    UIFont *font = [UIFont systemFontOfSize:defaultFontSize];
    CGAffineTransform matrix = CGAffineTransformMake(1, 0, tanf(15 * (CGFloat)M_PI / 180), 1, 0, 0);
    UIFontDescriptor *attributeFontDescriptor = [UIFontDescriptor fontDescriptorWithFontAttributes:
                                                 @{UIFontDescriptorFamilyAttribute: font.familyName,
                                                   UIFontDescriptorSizeAttribute: [NSNumber numberWithFloat:30]}];
    attributeFontDescriptor = [attributeFontDescriptor fontDescriptorWithSymbolicTraits:UIFontDescriptorTraitBold];
    attributeFontDescriptor = [attributeFontDescriptor fontDescriptorWithMatrix:matrix];
    return attributeFontDescriptor;
}

@end
