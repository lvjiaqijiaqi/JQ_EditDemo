//
//  EditStyleCollectionViewCell.m
//  TextKitDemo
//
//  Created by jqlv on 2018/3/21.
//  Copyright © 2018年 Max Seelemann. All rights reserved.
//

#import "EditStyleCollectionViewCell.h"

@interface EditStyleCollectionViewCell()

@property(nonatomic,strong) UIImageView *imageView;

@end

@implementation EditStyleCollectionViewCell


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(frame), CGRectGetHeight(frame))];
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:self.imageView];
    }
    return self;
}

-(void)layoutSubviews{
    self.imageView.frame = CGRectMake(0, 8, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame) - 15);
    [super layoutSubviews];
}

-(void)updateImage:(NSString *)imageName{
    self.imageView.image = [UIImage imageNamed:imageName];
}

-(void)didSelect{
    
}
-(void)cancelSelect{
}

@end
