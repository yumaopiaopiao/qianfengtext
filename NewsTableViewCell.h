//
//  NewsTableViewCell.h
//  小项目2
//
//  Created by 千锋 on 16/1/25.
//  Copyright (c) 2016年 千锋. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyNewsModle.h"
@interface NewsTableViewCell : UITableViewCell
@property (nonatomic,strong)UILabel *titleLabel;
@property (nonatomic,strong)UILabel *abstractLabel;
@property (nonatomic, strong)UIImageView *imageview;
@property (nonatomic,strong)MyNewsModle*NewModle;
@property (nonatomic,strong)UIButton *SubscribeBtn;
@end
