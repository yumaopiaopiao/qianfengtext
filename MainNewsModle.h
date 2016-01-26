//
//  MainNewsModle.h
//  小项目2
//
//  Created by 千锋 on 16/1/25.
//  Copyright (c) 2016年 千锋. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MainNewsModle : NSObject
@property (nonatomic,copy)NSString *Subtitle;
@property (nonatomic,copy)NSString *content;
@property (nonatomic,copy)NSString *img;
-(instancetype)initWithDictionary:(NSDictionary*)dic;

@end
