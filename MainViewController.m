//
//  MainViewController.m
//  小项目2
//
//  Created by 千锋 on 16/1/21.
//  Copyright (c) 2016年 千锋. All rights reserved.
//

#import "MainViewController.h"
#import "MyNewsModle.h"
#import "SubViewController.h"
#import "Common.h"
#import "MJRefresh.h"
#import "MainmenuViewController.h"
#import "NewsTableViewCell.h"
#import "MainDetailViewController.h"
@interface MainViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong)UITableView *tableview;
@property (nonatomic,strong)NSMutableArray *Mydata;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self setTitle:@"今日头条"];
    NSString *httpUrl = @"http://apis.baidu.com/songshuxiansheng/news/news";
    NSString *httpArg = @"";
    [self request: httpUrl withHttpArg: httpArg];
    [self creatTableView];
    [self creatItem];
    
       self.tableview.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 *NSEC_PER_SEC)),dispatch_get_main_queue(), ^{
            
            [self.tableview.mj_header endRefreshing];
        });
    }];
    self.tableview.mj_header.automaticallyChangeAlpha = YES;
    self.tableview.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0*NSEC_PER_SEC)),dispatch_get_main_queue(),^{
            
            [self.tableview.mj_footer endRefreshing];
            
        });
    }];
    
}
-(void)creatItem{

    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(searchonClick)];
    self.navigationItem.rightBarButtonItem = item;
    UIBarButtonItem *item2= [[UIBarButtonItem alloc]initWithTitle:@"返回主界面" style:UIBarButtonItemStyleDone target:self action:@selector(cancleClick)];
    self.navigationItem.leftBarButtonItem = item2;

}
-(void)cancleClick{
    
    [self.navigationController popViewControllerAnimated:YES];

}
-(void)searchonClick{
    SubViewController *sub = [[SubViewController alloc]init];
    [self.navigationController pushViewController:sub animated:YES];

}
-(NSMutableArray *)Mydata{
    if (_Mydata == nil) {
        _Mydata = [[NSMutableArray alloc]init];
    }
    return _Mydata;

}
-(void)request: (NSString*)httpUrl withHttpArg: (NSString*)HttpArg  {
        NSString *urlStr = [[NSString alloc]initWithFormat: @"%@?%@", httpUrl, HttpArg];
        NSURL *url = [NSURL URLWithString: urlStr];
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL: url cachePolicy: NSURLRequestUseProtocolCachePolicy timeoutInterval: 10];
        [request setHTTPMethod: @"GET"];
        [request addValue:kAppKey forHTTPHeaderField: @"apikey"];
        [NSURLConnection sendAsynchronousRequest: request queue: [NSOperationQueue mainQueue]completionHandler: ^(NSURLResponse *response, NSData *data, NSError *error){
            if (error) {
        NSLog(@"Httperror: %@%ld", error.localizedDescription, error.code);
            } else {
                NSDictionary *rootdic =[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
                for (NSDictionary *dic in rootdic[@"retData"])
                {
                    MyNewsModle *myNewsModle = [[MyNewsModle alloc]initWithDictionary:dic];
                    [self.Mydata addObject:myNewsModle];
                }
            }
            [self.tableview reloadData];
            }];
    }
-(void)creatTableView{
    _tableview =[[ UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStylePlain];
    self.tableview.showsVerticalScrollIndicator = NO;
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    [self.view addSubview:self.tableview];
  

}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.Mydata.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NewsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cid"];
    if (cell ==nil) {
        cell = [[NewsTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cid"];
    }
      cell.NewModle = self.Mydata[indexPath.row];
     return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{


    return 60;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    MainDetailViewController *detailNews = [[MainDetailViewController alloc]init];
    
    detailNews.DetailNews= self.Mydata[indexPath.row];
    [self.navigationController pushViewController:detailNews animated:YES];

}
@end
