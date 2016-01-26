//
//  MainDetailViewController.m
//  小项目2
//
//  Created by 千锋 on 16/1/25.
//  Copyright (c) 2016年 千锋. All rights reserved.
//

#import "MainDetailViewController.h"
#import "UIImageView+AFNetworking.h"
@interface MainDetailViewController ()

@end

@implementation MainDetailViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self creatImageView];
    [self creatTextview];
    [self creatItem];
}
-(void)creatItem{
    
    UIBarButtonItem *item2= [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:self action:@selector(cancleClick)];
    
//    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:10],NSForegroundColorAttributeName:[UIColor redColor                                                                                                                                                                                                                                               ]}];
    self.navigationItem.leftBarButtonItem = item2;
    
    
}
-(void)cancleClick{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}
-(void)creatImageView{
    UIImageView *newsImageView  = [[UIImageView alloc]initWithFrame:CGRectMake(40, 69,self.view.bounds.size.width-80,200)];
    [newsImageView setContentMode:UIViewContentModeRedraw];
    if (self.DetailNews.image_url != nil) {
        
        [newsImageView setImageWithURL:[NSURL URLWithString:self.DetailNews.image_url]placeholderImage:[UIImage imageNamed:@"2.png"]];
    }
    [self.view addSubview:newsImageView];
    
}
-(void)creatTextview
{
    UITextView *textview = [[UITextView alloc]initWithFrame:CGRectMake(10, 269, self.view.bounds.size.width-20, self.view.bounds.size.height - 269)];
    textview.text =[NSString stringWithFormat:@"%@", self.DetailNews.abstract];
    [textview setFont:[UIFont systemFontOfSize:16]];
    [textview setEditable:NO];
    [self.view addSubview:textview];
    
    
}

@end
