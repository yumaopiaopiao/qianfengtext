//
//  MyNewsModle.h
//  新闻小项目周超
//
//  Created by 千锋 on 16/1/21.
//  Copyright (c) 2016年 zhouchao. All rights reserved.
//

#import <Foundation/Foundation.h>
//"title": "普京\"失踪\"多日来首露面 会见吉尔吉斯斯坦总统",
//"content": "当地时间2015年3月16日,据外媒报道,俄罗斯总统<em>普京</em>16日在圣彼得堡与吉尔吉斯斯坦总统阿坦巴耶夫会晤。此次会晤是两位领导人2015年的第二次会晤,会晤也破除了此前外界流传的<em>普京</em>身体\"抱恙\"的传言。图片来源:东方ic 版权作品 请勿转载 (责任编辑 :史博超)",
//"img_width": "671",
//"full_title": "普京\"失踪\"多日来首露面 会见吉尔吉斯斯坦总统",
//"pdate": "1小时前",
//"src": "中国经济网",
//"img_length": "940",
//"img": "http://p1.qhimg.com/t0149ac168ffc124d73.jpg",
//"url": "http://intl.ce.cn/intlpic/gd/201503/17/t20150317_4842351.shtml",
//"pdate_src": "2015-03-17 10:08:00"
@interface MyNewsModle : NSObject
@property (nonatomic,copy)NSString *title;
@property (nonatomic,copy)NSString *abstract;
@property (nonatomic,copy)NSString *image_url;
@property (nonatomic,copy)NSString *url;

-(instancetype)initWithDictionary:(NSDictionary*)dic;
@end
