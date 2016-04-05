//
//  ZDFNewViewController.m
//  百思不得姐
//
//  Created by apple on 16/3/26.
//  Copyright © 2016年 oxxther. All rights reserved.
//

#import "ZDFNewViewController.h"

@interface ZDFNewViewController ()

@end

@implementation ZDFNewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置导航栏标题内容
    self.navigationItem.titleView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"MainTitle"]];
    
    //设置左边的按钮
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"MainTagSubIcon" highImage:@"MainTagSubIconClick" target:self action:@selector(NewClick)];
    
    //设置背景色
    self.view.backgroundColor = ZDFGlobalRGBColor;
}

- (void)NewClick{
    ZDFLogFunc
}
@end
