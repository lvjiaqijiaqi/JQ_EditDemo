//
//  EditFontCollectionViewCell.m
//  TextKitDemo
//
//  Created by jqlv on 2018/3/21.
//  Copyright © 2018年 Max Seelemann. All rights reserved.
//

#import "EditFontCollectionViewCell.h"

@interface EditFontCollectionViewCell()

@property(nonatomic,strong) UILabel *fontLabel;
@property(nonatomic,strong) UIView *selectLine;

@end

@implementation EditFontCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.fontLabel = [[UILabel alloc] init];
        self.fontLabel.textAlignment = NSTextAlignmentCenter;
        self.fontLabel.font = [UIFont systemFontOfSize:12];
        self.selectLine = [[UIView alloc] init];
        self.selectLine.backgroundColor = [UIColor blueColor];
        /*self.colorView.layer.cornerRadius = 2;
        self.colorView.layer.borderWidth = 1;
        self.colorView.layer.masksToBounds = YES;
        self.colorView.layer.borderColor = [UIColor clearColor].CGColor;*/
        self.selectLine.hidden = YES;
        [self addSubview:self.selectLine];
        [self addSubview:self.fontLabel];
    }
    return self;
}

-(void)setFontSize:(NSInteger)fontSize{
    self.fontLabel.text = [NSString stringWithFormat:@"%ldpx",fontSize];
}
-(void)didSelect{
    self.selectLine.hidden = NO;
}
-(void)cancelSelect{
    self.selectLine.hidden = YES;
}

-(void)layoutSubviews{
    self.fontLabel.frame = CGRectMake(2, 2, CGRectGetWidth(self.frame)-4, CGRectGetHeight(self.frame)-4);
    self.selectLine.frame = CGRectMake(0, CGRectGetHeight(self.frame)-4, CGRectGetWidth(self.frame), 4);
    [super layoutSubviews];
}

@end
