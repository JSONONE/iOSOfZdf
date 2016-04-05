//
//  ZDFFriendTrendsViewController.m
//  百思不得姐
//
//  Created by apple on 16/3/26.
//  Copyright © 2016年 oxxther. All rights reserved.
//

#import "ZDFFriendTrendsViewController.h"
#import "ZDFRecommendController.h"
#import "ZDFLoginRegisterController.h"


@interface ZDFFriendTrendsViewController ()

@end

@implementation ZDFFriendTrendsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置导航栏标题内容
    self.navigationItem.title = @"我的关注";
    
    //设置左边的按钮
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"friendsRecommentIcon" highImage:@"friendsRecommentIcon-click" target:self action:@selector(friendsClick)];
    
    //设置背景色
    self.view.backgroundColor = ZDFGlobalRGBColor;
}

- (void)friendsClick{
    ZDFLogFunc
    ZDFRecommendController *vc = [[ZDFRecommendController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)loginRegister:(id)sender {
    ZDFLoginRegisterController *c = [[ZDFLoginRegisterController alloc]init];
    [self presentViewController:c animated:YES completion:nil];
}
@end
