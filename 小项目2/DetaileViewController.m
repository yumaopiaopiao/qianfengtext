
//
//  DetaileViewController.m
//  小项目2
//
//  Created by 千锋 on 16/1/22.
//  Copyright (c) 2016年 千锋. All rights reserved.
//

#import "DetaileViewController.h"
#import "UIImageView+AFNetworking.h"
@interface DetaileViewController ()

@end

@implementation DetaileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:self.NewsModle.Subtitle];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self creatImageView];
    [self creatTextview];
}
-(void)creatImageView{
    UIImageView *newsImageView  = [[UIImageView alloc]initWithFrame:CGRectMake(40, 69,self.view.bounds.size.width-80,200)];
    //[newsImageView setContentMode:UIViewContentModeScaleAspectFit];
    if (self.NewsModle.img != nil) {
        
        [newsImageView setImageWithURL:[NSURL URLWithString:self.NewsModle.img]placeholderImage:[UIImage imageNamed:@"2.png"]];
    }
        [self.view addSubview:newsImageView];

}
-(void)creatTextview
{
    UITextView *textview = [[UITextView alloc]initWithFrame:CGRectMake(10, 269, self.view.bounds.size.width-20, self.view.bounds.size.height - 269)];
    textview.text =[NSString stringWithFormat:@"     %@", self.NewsModle.content];
    [textview setFont:[UIFont systemFontOfSize:16]];
    [textview setEditable:NO];
    [self.view addSubview:textview];
    
    
}
@end
