//
//  MainmenuViewController.m
//  小项目2
//
//  Created by 千锋 on 16/1/22.
//  Copyright (c) 2016年 千锋. All rights reserved.
//

#import "MainmenuViewController.h"
#import "ChildrenView.h"
#import "MainViewController.h"
#import "KitchenMenuViewController.h"
#import "MovieViewController.h"
#import "MineViewController.h"
#define kCount 4
@interface MainmenuViewController ()<UIScrollViewDelegate,UIPageViewControllerDelegate>
@property (nonatomic,strong)UIPageControl *pagecontrol;
@property (nonatomic,strong)UIScrollView *MenuScroll;
@property (nonatomic,strong)NSTimer *timer;
@end

@implementation MainmenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    UIImageView *imgview = [[UIImageView alloc]initWithFrame:self.view.bounds];
    [imgview setImage:[UIImage imageNamed:@"5.jpg"]];
    [self.view addSubview:imgview];
    [self creatNavigationItem];
    [self creatData];
    [self creatScrollView];
    [self creatPageControl];
    [self creatView];
}
-(void)creatView{
    NSArray *titleArr = @[@"新闻",@"电影",@"菜谱",@"我的"];
    NSArray *imgArr = @[@"1.jpg",@"2.jpg",@"3.jpg",@"4.jpg"];
    for (NSInteger i = 0; i < 4; i++) {
        ChildrenView *children = [[ChildrenView alloc]initWithTitleLabel:titleArr[i] andImageView:imgArr[i]];
        [children setFrame:CGRectMake(i % 2 *self.view.bounds.size.width / 2+40, i /2 * self.view.bounds.size.height / 4+264, 120, 120)];
        [children.layer setCornerRadius:60];
        [children.layer setMasksToBounds:YES];
        [children.layer setBorderWidth:1.0];
        CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
        CGColorRef colorref = CGColorCreate(colorspace, (CGFloat[]){arc4random()%255/256.0,arc4random()%255/256.0,arc4random()%255/256.0,1});
//        CGColorRef colorref = CGColorCreate(colorspace, (CGFloat[]){1,1,0.06,1});
        [children.layer setBorderColor:colorref];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(onTap:)];
        [children setUserInteractionEnabled:YES];
        [children addGestureRecognizer:tap];
        [tap setNumberOfTouchesRequired:1];
        [children setTag:i+100];
        
        [self.view addSubview:children];
        
    }
}
-(void)onTap:(UITapGestureRecognizer*)tap{
    MainViewController *main = [[MainViewController alloc]init];
    MovieViewController *movie = [[MovieViewController alloc]init];
    KitchenMenuViewController *kitchen =[[KitchenMenuViewController alloc ]init];
    MineViewController *mine = [[MineViewController alloc]init];
    
    switch (tap.view.tag) {
        case 100:
            [self.navigationController pushViewController:main animated:YES];
            break;
        case 101:
            [self.navigationController pushViewController:movie animated:YES];
            break;
        case 102:
            [self.navigationController pushViewController:kitchen animated:YES];
            break;
        case 103:
            [self.navigationController pushViewController:mine animated:YES];
            break;

        default:
            break;
    }

}
-(void)creatNavigationItem{

//    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"header_bg.png"] forBarMetrics:UIBarMetricsDefault];
//    [self.navigationController.navigationBar setFrame:CGRectMake(0, 64, self.view.bounds.size.width - 100,40)];
}
-(void)creatData{

   // NSURL *url = [NSURL URLWithString:@""]

}
-(void)creatScrollView{

    UIScrollView *MenuScroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height / 4-10)];
    [MenuScroll setPagingEnabled:YES];
    [MenuScroll setUserInteractionEnabled:YES];
    [MenuScroll setContentMode:UIViewContentModeScaleAspectFill];
    
    [self.view addSubview:MenuScroll];
    MenuScroll.delegate = self;
    
    for (NSInteger i = 0; i < kCount; i++) {
        UIImageView *myImageView = [[UIImageView alloc]initWithFrame:CGRectMake(i*self.view.bounds.size.width, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
        [myImageView setBackgroundColor:[UIColor colorWithRed:arc4random()%255/256.0 green:arc4random()%255/256.0 blue:arc4random()%255/256.0 alpha:1]];
        [MenuScroll addSubview:myImageView];
    }
    [MenuScroll setContentSize: CGSizeMake(kCount*self.view.bounds.size.width, self.view.bounds.size.height / 2)];
   
    self.MenuScroll = MenuScroll;
    [self CreatTimer];
}
-(void)creatPageControl{
    UIPageControl *pagecontrol = [[UIPageControl alloc]initWithFrame:CGRectMake(self.view.bounds.size.width - 80, self.view.bounds.size.height / 4+34, 80, 20)];
    [pagecontrol setEnabled:YES];
    [pagecontrol setHighlighted:YES];
    [pagecontrol setNumberOfPages:kCount];
    [pagecontrol setBackgroundColor:[UIColor orangeColor]];
    [pagecontrol setContentMode:UIViewContentModeRedraw];
    [pagecontrol setAlpha:0.5];
    [pagecontrol addTarget:self action:@selector(onChang:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:pagecontrol];
    self.pagecontrol = pagecontrol;
    
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{

    self.pagecontrol.currentPage = scrollView.contentOffset.x / scrollView.bounds.size.width;

}
-(void)onChang:(UIPageControl*)sender{
self.MenuScroll.contentOffset = CGPointMake(sender.currentPage*self.view.bounds.size.width, 0);

}
-(void)CreatTimer{
    
    
    if (self.timer == nil) {
        self.timer =[NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(onChange:) userInfo:nil repeats:YES];
    }
}
-(void)onChange:(NSTimer*)sender{
    int i = self.MenuScroll.contentOffset.x;
    int width = [[UIScreen mainScreen]bounds].size.width;
    if (i +width >= width * 4) {
        i = 0;
    }else{
        i= i+width;
    }
    self.MenuScroll.contentOffset = CGPointMake(i, 0);
}

@end
