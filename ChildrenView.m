//
//  ChildrenView.m
//  小项目2
//
//  Created by 千锋 on 16/1/22.
//  Copyright (c) 2016年 千锋. All rights reserved.
//

#import "ChildrenView.h"

@implementation ChildrenView

-(instancetype)initWithTitleLabel:(NSString *)titile andImageView:(NSString *)IconImage
{

    self = [super init];
    if (self) {
        UILabel *titleLaber = [[UILabel alloc]initWithFrame:CGRectMake(23, 100, 80, 20)];
        
        [titleLaber setTextAlignment:NSTextAlignmentCenter];
        [titleLaber setText:titile];
        [self addSubview:titleLaber];
        UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:IconImage]];
        [imageView setFrame:CGRectMake(10, 0,100, 100)];
        
        [self addSubview:imageView];
        
        
    }
    return self;
}
@end
