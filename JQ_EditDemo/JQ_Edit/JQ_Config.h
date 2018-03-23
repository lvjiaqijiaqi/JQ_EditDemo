//
//  JQ_Config.h
//  JQ_EditDemo
//
//  Created by jqlv on 2018/3/23.
//  Copyright © 2018年 jqlv. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JQ_Config : NSObject

-(UIColor *)defaultColor:(NSString *)colorStr;
+(instancetype)shareInstance;

@end
