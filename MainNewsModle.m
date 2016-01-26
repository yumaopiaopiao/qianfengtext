//
//  MainNewsModle.m
//  小项目2
//
//  Created by 千锋 on 16/1/25.
//  Copyright (c) 2016年 千锋. All rights reserved.
//

#import "MainNewsModle.h"

@implementation MainNewsModle
-(instancetype)initWithDictionary:(NSDictionary*)dic{
    self = [super init];
    if (self) {
        self.img = dic[@"img"];
        self.content = dic[@"content"];
        self.Subtitle = dic[@"full_title"];
    }
    return self;
}

@end
