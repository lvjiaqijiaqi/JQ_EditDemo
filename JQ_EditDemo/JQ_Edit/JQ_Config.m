//
//  JQ_Config.m
//  JQ_EditDemo
//
//  Created by jqlv on 2018/3/23.
//  Copyright © 2018年 jqlv. All rights reserved.
//

#import "JQ_Config.h"
#import "UIColor+Extension.h"

const static NSDictionary *colors;

static JQ_Config *defaultConfig = nil;

@implementation JQ_Config

+(instancetype)shareInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (defaultConfig == nil) {
            defaultConfig = [[self alloc] init];
        }
    });
    return defaultConfig;
}
+(instancetype)allocWithZone:(struct _NSZone *)zone{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (defaultConfig == nil) {
            defaultConfig = [super allocWithZone:zone];
        }
    });
    return defaultConfig;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}
-(id)copy{
    return self;
}

-(UIColor *)defaultColor:(NSString *)colorStr{
    colors = @{
                 @"#000000" : [UIColor colorWithR:0 G:0 B:0],
                 @"Black" : [UIColor colorWithR:0 G:0 B:0],//纯黑
                 @"#FFFFFF" : [UIColor colorWithR:255 G:255 B:255],
                 @"White" : [UIColor colorWithR:255 G:255 B:255],//纯白
                 @"#FF0000" : [UIColor colorWithR:255 G:0 B:0],
                 @"Red" : [UIColor colorWithR:255 G:0 B:0],//纯红
                 @"#F08080" : [UIColor colorWithR:240 G:128 B:128],
                 @"LightCoral" : [UIColor colorWithR:240 G:128 B:128],//淡珊瑚色
                 @"#FFFF00" : [UIColor colorWithR:255 G:255 B:0],
                 @"Yellow" : [UIColor colorWithR:255 G:255 B:0],//纯黄
                 @"#008000" : [UIColor colorWithR:0 G:128 B:0],
                 @"Green" : [UIColor colorWithR:0 G:128 B:0],//纯绿
                 @"#98FB98" : [UIColor colorWithR:152 G:251 B:152],
                 @"PaleGreen" : [UIColor colorWithR:152 G:251 B:152],//苍白的绿色
                 @"#0000FF" : [UIColor colorWithR:0 G:0 B:255],
                 @"Blue" : [UIColor colorWithR:0 G:0 B:255],//纯蓝
                 @"#808080" : [UIColor colorWithR:128 G:128 B:128],
                 @"Gray" : [UIColor colorWithR:128 G:128 B:128],//灰色
                 @"#7FFFAA" : [UIColor colorWithR:127 G:255 B:170],
                 @"Auqamarin" : [UIColor colorWithR:127 G:255 B:170],//绿玉\碧绿色
                 @"#87CEEB" : [UIColor colorWithR:135 G:206 B:235],
                 @"SkyBlue" : [UIColor colorWithR:135 G:206 B:235]//天蓝色
                 };
    return colors[colorStr];
}


@end
