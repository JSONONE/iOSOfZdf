//
//  ZDFRecommendController.m
//  百思不得姐
//
//  Created by 业余班 on 16/3/27.
//  Copyright © 2016年 oxxther. All rights reserved.
//

#import "ZDFRecommendController.h"
#import <AFNetworking.h>
#import <SVProgressHUD.h>
#import <MJExtension.h>
#import <MJRefresh.h>

#import "ZDFRecommendType.h"
#import "ZDFRecommendCategoriesCell.h"
#import "ZDFRecommendUser.h"
#import "ZDFUserCell.h"

#define ZDFSelectedCategory self.categories[[self.categoryTableView indexPathForSelectedRow].row]

@interface ZDFRecommendController ()<UITableViewDataSource,UITableViewDelegate>
/** 左边表格 */
@property (weak, nonatomic) IBOutlet UITableView *categoryTableView;
/** 左边数据 */
@property (nonatomic,strong) NSArray *categories;

/** 右边表格 */
@property (weak, nonatomic) IBOutlet UITableView *userTableView;

@property (strong,nonatomic) NSDictionary *paramDic;

@property (strong,nonatomic) AFHTTPSessionManager *manager;
@end

@implementation ZDFRecommendController

static NSString * const ZDFCategoriesId = @"Categories";
static NSString * const ZDFUserId = @"User";

- (AFHTTPSessionManager *)manager{
    if (!_manager) {
        _manager = [AFHTTPSessionManager manager];
#warning 请求超时
        [_manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
        _manager.requestSerializer.timeoutInterval = 5.;
        [_manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    }
    return _manager;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //控件初始化
    [self setupTableView];
    
    //添加刷新控件
    [self setupRefresh];
    
    //加入界面交互
    [SVProgressHUD showWithMaskType:SVProgressHUDMaskTypeBlack];
    
    [self loadCategory];
}

- (void)loadCategory{
    //发送请求
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = @"category";
    params[@"c"] = @"subscribe";
    
    [self.manager GET:@"http://api.budejie.com/api/api_open.php" parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        //隐藏
        [SVProgressHUD dismiss];
        
        //
        self.categories = [ZDFRecommendType mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        
        //刷新表格
        [self.categoryTableView reloadData];
        
        //默认选中第一行
        [self.categoryTableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:NO scrollPosition:UITableViewScrollPositionTop];
        
        [self.userTableView.mj_header beginRefreshing];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [SVProgressHUD showErrorWithStatus:@"请求数据失败!"];
    }];
}

- (void)setupTableView{
    self.navigationItem.title = @"推荐关注";
    
    self.view.backgroundColor = ZDFGlobalRGBColor;
    
    //注册
    [self.categoryTableView registerNib:[UINib nibWithNibName:NSStringFromClass([ZDFRecommendCategoriesCell class]) bundle:nil] forCellReuseIdentifier:ZDFCategoriesId];
    
    [self.userTableView registerNib:[UINib nibWithNibName:NSStringFromClass([ZDFUserCell class]) bundle:nil] forCellReuseIdentifier:ZDFUserId];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.categoryTableView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
    self.userTableView.contentInset = self.categoryTableView.contentInset;
    self.userTableView.rowHeight = 70.;
    
}

- (void)setupRefresh{
    //加入头部刷新视图
    self.userTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNow)];
    
     self.userTableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMore)];
}

- (void)checkRefreshState{
    ZDFRecommendType *type = ZDFSelectedCategory;
    
    if (type.users.count == type.total) {
        [self.userTableView.mj_footer endRefreshingWithNoMoreData];
    }else{
        [self.userTableView.mj_footer endRefreshing];
    }
    //控制每次刷新右边数据时,控制footer显示或隐藏
    self.userTableView.mj_footer.hidden = (type.count== 0);
}

#pragma mark - loadNow
- (void)loadNow{
    ZDFRecommendType *type = ZDFSelectedCategory;
    
    type.currentPage = 1;
    
    //发送请求
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = @"list";
    params[@"c"] = @"subscribe";
    params[@"category_id"] = @(type.ID);
    params[@"page"] = @(type.currentPage);
    self.paramDic = params;
    
    [self.manager GET:@"http://api.budejie.com/api/api_open.php" parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //加载新数据是把数组清空下
        [type.users removeAllObjects];
        
        //
        NSArray *users = [ZDFRecommendUser mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        [type.users addObjectsFromArray:users];
        
        type.total = [responseObject[@"total"] integerValue];
        
        //重复请求
        if (self.paramDic != params) return;
        
        [self.userTableView reloadData];
        
        [self.userTableView.mj_header endRefreshing];
        
        [self checkRefreshState];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //重复请求
        if (self.paramDic != params) return;
        
        [self.userTableView.mj_header endRefreshing];
        [SVProgressHUD showErrorWithStatus:@"请求数据失败!"];
    }];
}

#pragma mark - loadMore
- (void)loadMore{
    ZDFRecommendType *type = ZDFSelectedCategory;
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = @"list";
    params[@"c"] = @"subscribe";
    params[@"category_id"] = @(type.ID);
    params[@"page"] = @(++type.currentPage);
    self.paramDic = params;
    
    [self.manager GET:@"http://api.budejie.com/api/api_open.php" parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //
        NSArray *users = [ZDFRecommendUser mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        [type.users addObjectsFromArray:users];
        
        if (self.paramDic != params) return;
        
        [self.userTableView reloadData];
        
        //
        [self checkRefreshState];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (self.paramDic != params) return;
        
        [SVProgressHUD showErrorWithStatus:@"请求数据失败!"];
    }];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == self.categoryTableView) {
        return self.categories.count;
    }else {
        [self checkRefreshState];
        return [ZDFSelectedCategory users].count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (tableView == self.categoryTableView) {
        ZDFRecommendCategoriesCell *cell = [tableView dequeueReusableCellWithIdentifier:ZDFCategoriesId forIndexPath:indexPath];
        cell.type = self.categories[indexPath.row];
        return cell;
    }else{
        ZDFUserCell *cell = [tableView dequeueReusableCellWithIdentifier:ZDFUserId forIndexPath:indexPath];
        cell.user = [ZDFSelectedCategory users][indexPath.row];
        return cell;
    }
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == self.categoryTableView) {
        
        //确保刷新状态
        [self.userTableView.mj_header endRefreshing];
        [self.userTableView.mj_footer endRefreshing];
        
        ZDFRecommendType *type = self.categories[indexPath.row];
      
        if (type.users.count) {
            [self.userTableView reloadData];
        }else{
   
            //马上显示category的用户数据
            [self.userTableView reloadData];
            
            [self.userTableView.mj_header beginRefreshing];
        }
    }else{
    }
}


#pragma mark - 控制器销毁
- (void)dealloc{
    [self.manager.operationQueue cancelAllOperations];
}
/**
 *  1.只能显示1页数据
    2.重复发请求
    3.如果网速慢带来的细节问题
 */
@end
