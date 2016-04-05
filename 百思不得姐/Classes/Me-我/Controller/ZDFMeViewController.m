//
//  ZDFMeViewController.m
//  百思不得姐
//
//  Created by apple on 16/3/26.
//  Copyright © 2016年 oxxther. All rights reserved.
//

#import "ZDFMeViewController.h"

@interface ZDFMeViewController ()

@end

@implementation ZDFMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置导航栏标题内容
    self.navigationItem.title = @"我的";
    
    //设置右边的按钮
    UIBarButtonItem *settingItem = [UIBarButtonItem itemWithImage:@"mine-setting-icon" highImage:@"mine-setting-icon-click" target:self action:@selector(settingClick)];
    
    UIBarButtonItem *nightModeItem = [UIBarButtonItem itemWithImage:@"mine-moon-icon" highImage:@"mine-moon-icon-click" target:self action:@selector(nightModeClick)];
    
    self.navigationItem.rightBarButtonItems = @[
                                       settingItem,nightModeItem
    ];
    
    //设置背景色
    self.view.backgroundColor = ZDFGlobalRGBColor;
}

- (void)settingClick{
    ZDFLogFunc
}

- (void)nightModeClick{
    ZDFLogFunc
}

@end
