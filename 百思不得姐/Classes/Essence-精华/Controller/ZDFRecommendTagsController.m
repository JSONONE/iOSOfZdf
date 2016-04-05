//
//  ZDFRecommendTagsController.m
//  百思不得姐
//
//  Created by apple on 16/3/31.
//  Copyright © 2016年 oxxther. All rights reserved.
//

#import "ZDFRecommendTagsController.h"
#import <AFNetworking.h>
#import <SVProgressHUD.h>
#import <MJExtension.h>

#import "ZDFTagModel.h"
#import "ZDFTagsCell.h"
@interface ZDFRecommendTagsController ()

@property (nonatomic,strong) NSArray *tagsArr;

@end

@implementation ZDFRecommendTagsController


static NSString * const ZDFTagsId = @"Tags";
- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self setupTableView];
    
    [self loadTagData];
}

- (void)setupTableView{
    self.navigationItem.title = @"推荐订阅";
    
    //设置行高
    self.tableView.rowHeight = 70.;
    //去除分割线
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.tableView.backgroundColor = ZDFGlobalRGBColor;
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([ZDFTagsCell class]) bundle:nil] forCellReuseIdentifier:ZDFTagsId];
}

- (void)loadTagData{
    //发送请求
    [SVProgressHUD showWithMaskType:SVProgressHUDMaskTypeBlack];
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = @"tag_recommend";
    params[@"c"] = @"topic";
    params[@"action"] = @"sub";
    
    [[AFHTTPSessionManager manager] GET:@"http://api.budejie.com/api/api_open.php" parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        self.tagsArr = [ZDFTagModel mj_objectArrayWithKeyValuesArray:responseObject];
        [self.tableView reloadData];
        
        [SVProgressHUD dismiss];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [SVProgressHUD showErrorWithStatus:@"请求失败！"];
    }];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tagsArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZDFTagsCell *cell = [tableView dequeueReusableCellWithIdentifier:ZDFTagsId forIndexPath:indexPath];
    
    cell.recommendTags = self.tagsArr[indexPath.row];
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
