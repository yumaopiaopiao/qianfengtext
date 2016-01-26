//
//  MyNewsModle.m
//  新闻小项目周超
//
//  Created by 千锋 on 16/1/21.
//  Copyright (c) 2016年 zhouchao. All rights reserved.
//

#import "MyNewsModle.h"


@implementation MyNewsModle

-(instancetype)initWithDictionary:(NSDictionary*)dic{
    self = [super init];
    if (self) {
        self.title = dic[@"title"];
        self.abstract = dic[@"abstract"];
        self.image_url = dic[@"image_url"];
        self.url = dic[@"url"];

    }
    return self;
}
@end
