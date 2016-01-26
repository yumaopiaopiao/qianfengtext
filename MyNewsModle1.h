//
//  MyNewsModle.h
//  新闻小项目周超
//
//  Created by 千锋 on 16/1/21.
//  Copyright (c) 2016年 zhouchao. All rights reserved.
//

#import <Foundation/Foundation.h>
//title	string	新闻标题
//content	string	新闻摘要内容
//img_width	string	图片宽度
//full_title	string	完整标题
//pdate	string	发布时间
//src	string	新闻来源
//img_length	string	图片高度
//img	string	图片链接
//url	string	新闻链接
//pdate_src	string	发布完整时间
@interface MyNewsModle1 : NSObject
@property (nonatomic,copy)NSString *title;
@property (nonatomic,copy)NSString *abstract;
@property (nonatomic,copy)NSString *image_url;
@property (nonatomic,copy)NSString *url;
-(instancetype)initWithDictionary:(NSDictionary*)dic;
@end
