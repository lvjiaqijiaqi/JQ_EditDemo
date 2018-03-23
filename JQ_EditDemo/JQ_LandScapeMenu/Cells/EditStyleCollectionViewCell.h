//
//  EditStyleCollectionViewCell.h
//  TextKitDemo
//
//  Created by jqlv on 2018/3/21.
//  Copyright © 2018年 Max Seelemann. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EditStyleCollectionViewCell : UICollectionViewCell

-(void)updateImage:(NSString *)imageName;
-(void)didSelect;
-(void)cancelSelect;

@end
