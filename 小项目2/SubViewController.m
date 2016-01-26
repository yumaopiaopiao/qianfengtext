//
//  SubViewController.m
//  小项目2
//
//  Created by 千锋 on 16/1/21.
//  Copyright (c) 2016年 千锋. All rights reserved.
//

#import "SubViewController.h"
#import "Common.h"
#import "MainNewsModle.h"
#import "UIImageView+AFNetworking.h"
#import "DetaileViewController.h"
#import "MJRefresh.h"
#define kApikey @"6ee9d32e637563f79342eb23070af35b"
@interface SubViewController ()<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>
@property (nonatomic,strong)NSString  *textString;
@property (nonatomic ,strong)UITextField *search;
@property (nonatomic ,strong)UITableView *tableview;
@property (nonatomic,strong)NSMutableArray *dataArr;

@end

@implementation SubViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"查询"];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:self action:@selector(cancleClick)];
    self.navigationItem.leftBarButtonItem = item;
   
    [self creatSearchItem];
   }
-(void)cancleClick{
    [self.navigationController popViewControllerAnimated:YES];
}
-(NSMutableArray *)dataArr{
    if (_dataArr == nil) {
        _dataArr = [[NSMutableArray alloc]init];
        
    }
    return _dataArr;
}
-(void)creatData{
    if (self.textString == nil) {
        return;
    }
    else
    {
    NSString *path = [NSString stringWithFormat:@"http://op.juhe.cn/onebox/news/query?key=%@&q=%@",kApikey,[self.textString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
        NSLog(@"%@",path);
    NSURL *url = [NSURL URLWithString:path];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        if (data != nil && connectionError == nil) {
          
            NSDictionary *rootdic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
                       if ([rootdic[@"result"] isKindOfClass:[NSNull class]]){
            
                [self creatAlertView];
                           
            }
            else
            {
                for (NSDictionary *dic in rootdic[@"result"]) {
                    MainNewsModle *modle = [[MainNewsModle alloc]initWithDictionary:dic];
                  
                    [self.dataArr addObject:modle];
                   
                }
                [self.tableview reloadData];
              
            }
        }
        else {
         
            [self creatAlertView];
            

        }
        
    }];

}
}
-(void)creatAlertView{

    UIAlertView *alertview = [[UIAlertView alloc]initWithTitle:@"提示" message:@"没有找到你想要的新闻" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [alertview setFrame:CGRectMake(100, 100, 80, 40)];

//    [alertview setCenter:CGPointMake(self.view.bounds.size.width / 2, self.view.bounds.size.height / 2)];
    [alertview show];
   

}
-(void)creatTableView{
    UITableView *tableview = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [tableview setFrame:CGRectMake(0, 104, self.view.bounds.size.width, self.view.bounds.size.height - 104)];
    tableview.separatorStyle = NO;
    self.tableview = tableview;
    [self.view addSubview:tableview];
    self.tableview.dataSource =self;
    self.tableview.delegate =self;
    self.tableview.showsVerticalScrollIndicator = NO;

}
-(void)creatSearchItem{
    _search = [[UITextField alloc]init];
    [self.search setFrame:CGRectMake(0, 64, self.view.bounds.size.width, 40)];
    self.search.clearButtonMode = UITextFieldViewModeAlways;
    [self.view addSubview:_search];
    [self.search setPlaceholder:@"请输入新闻关键字"];
    self.search.borderStyle= UITextBorderStyleRoundedRect;
    self.search.delegate =self;

}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

return 50;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (self.dataArr == nil) {
        return 10;
    }
    return self.dataArr.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cid"];
    if (cell == nil) {
        cell =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cid"];
    }
    MainNewsModle *Mymodle = self.dataArr[indexPath.row];
    cell.textLabel.text = Mymodle.Subtitle;
    [cell.textLabel setFont:[UIFont systemFontOfSize:15]];
    cell.detailTextLabel.text = Mymodle.content;
    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    [cell.imageView setFrame:CGRectMake(15, 0,100,cell.bounds.size.height)];
    [cell.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    if (Mymodle.img != nil) {
        [cell.imageView setImageWithURL:[NSURL URLWithString:Mymodle.img]placeholderImage:[UIImage imageNamed:@"1.png"]];
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    DetaileViewController *detaile = [[DetaileViewController alloc]init];
    detaile.NewsModle = self.dataArr[indexPath.row];
    [self.navigationController pushViewController:detaile animated:YES];

}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    if (self.dataArr !=nil) {
        [self.dataArr removeAllObjects];
    }
    [textField resignFirstResponder];
    self.textString =textField.text;
    [self creatData];
    [self creatTableView];
    
    [self.tableview reloadData];
    [self reloadData];
        return YES;
}
-(void)reloadData{
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
@end
