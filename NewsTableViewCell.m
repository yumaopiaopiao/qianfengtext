//
//  NewsTableViewCell.m
//  小项目2
//
//  Created by 千锋 on 16/1/25.
//  Copyright (c) 2016年 千锋. All rights reserved.
//

#import "NewsTableViewCell.h"
#import "UIImageView+AFNetworking.h"
@implementation NewsTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self creatUI];
    }
    return self;
}

-(void)creatUI{

    self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(80, 0, self.bounds.size.width-30,40)];
    [self.titleLabel setFont:[UIFont systemFontOfSize:12 weight:10]];
    [self.titleLabel setNumberOfLines:2];
    self.abstractLabel  = [[UILabel alloc]initWithFrame:CGRectMake(80, 35, self.bounds.size.width - 80, 20)];
    [self.abstractLabel setFont:[UIFont systemFontOfSize:10 weight:5]];
    [self.abstractLabel setNumberOfLines:0];
    [self.imageView setFrame:CGRectMake(0, 0, 100, 60)];
    [self.imageView setContentMode:UIViewContentModeScaleAspectFit];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [self addSubview:self.titleLabel];
    [self addSubview:self.abstractLabel];
    [self addSubview:self.imageView];
    UIImage *Falseimg = [UIImage imageNamed:@"false.png"];
    UIImage *Tureimg = [UIImage imageNamed:@"true.png"];
    self.SubscribeBtn = [[UIButton alloc]initWithFrame:CGRectMake(335, 40, 40,20)];
    [self.SubscribeBtn.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [self.SubscribeBtn setBackgroundImage:Falseimg forState:UIControlStateNormal];
    [self.SubscribeBtn setBackgroundImage:Tureimg forState:UIControlStateSelected];
    [self addSubview:self.SubscribeBtn];
    self.SubscribeBtn.selected = NO;
    [self.SubscribeBtn addTarget:self action:@selector(onSelectClick:) forControlEvents:UIControlEventTouchDown ];

}
-(void)onSelectClick:(UIButton*)sender{
    sender.selected = !sender.selected;
    
    if (sender.selected ==YES) {
        
        NSLog(@"数据持久化");
    }else{
    
        NSLog(@"本地数据删除");
    }

}
-(void)setNewModle:(MyNewsModle *)NewModle{
    self.titleLabel.text = NewModle.title;
    self.abstractLabel.text = NewModle.abstract;
    [self.imageView setImageWithURL:[NSURL URLWithString:NewModle.image_url] placeholderImage:[UIImage imageNamed:@"1.png"]];

}
@end
