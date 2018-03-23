//
//  EditColorCollectionViewCell.m
//  TextKitDemo
//
//  Created by jqlv on 2018/3/21.
//  Copyright © 2018年 Max Seelemann. All rights reserved.
//

#import "EditColorCollectionViewCell.h"

@interface EditColorCollectionViewCell()

@property(nonatomic,strong) UIView *colorView;

@end

@implementation EditColorCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.colorView = [[UIView alloc] init];
        self.colorView.layer.cornerRadius = 2;
        self.colorView.layer.borderWidth = 1;
        self.colorView.layer.masksToBounds = YES;
        self.colorView.layer.borderColor = [UIColor clearColor].CGColor;
        [self addSubview:self.colorView];
    }
    return self;
}

-(void)layoutSubviews{
    self.colorView.frame = CGRectMake(2, 2, CGRectGetWidth(self.frame)-4, CGRectGetHeight(self.frame)-4);
    [super layoutSubviews];
}
-(void)setColor:(UIColor *)color{
    self.colorView.backgroundColor = color;
}
-(void)didSelect{
    self.colorView.layer.borderColor = [UIColor blueColor].CGColor;
}
-(void)cancelSelect{
    self.colorView.layer.borderColor = [UIColor clearColor].CGColor;
}
@end
