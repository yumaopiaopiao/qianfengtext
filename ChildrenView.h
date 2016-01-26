//
//  ChildrenView.h
//  小项目2
//
//  Created by 千锋 on 16/1/22.
//  Copyright (c) 2016年 千锋. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChildrenView : UIView
@property (nonatomic,copy)UILabel *titile;
@property (nonatomic,copy)UIImageView *IconImage;
-(instancetype)initWithTitleLabel:(NSString*)titile andImageView:(NSString*)IconImage;
@end
