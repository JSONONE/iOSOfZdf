//
//  ZDFTabBarController.m
//  百思不得姐
//
//  Created by apple on 16/3/26.
//  Copyright © 2016年 oxxther. All rights reserved.
//

#import "ZDFTabBarController.h"
#import "ZDFEssenceViewController.h"
#import "ZDFNewViewController.h"
#import "ZDFFriendTrendsViewController.h"
#import "ZDFMeViewController.h"

#import "ZDFNavigationController.h"

#import "ZDFTabBar.h"

@interface ZDFTabBarController ()

@end

@implementation ZDFTabBarController

+ (void)initialize{
    //通过appearance统一设置
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    attrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSFontAttributeName] = attrs[NSFontAttributeName];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    
    UITabBarItem *tabBarItem = [UITabBarItem appearance];
    [tabBarItem setTitleTextAttributes:attrs forState:UIControlStateNormal];
    [tabBarItem setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
       //创建子控制器并将添加到tabBarController
    [self setupChildViewController:[[ZDFEssenceViewController alloc]init] Title:@"精华" image:@"tabBar_essence_icon" selectedImage:@"tabBar_essence_click_icon"];
    
    [self setupChildViewController:[[ZDFNewViewController alloc]init] Title:@"新帖" image:@"tabBar_new_icon" selectedImage:@"tabBar_new_click_icon"];
    
    [self setupChildViewController:[[ZDFFriendTrendsViewController alloc]init] Title:@"关注" image:@"tabBar_friendTrends_icon" selectedImage:@"tabBar_friendTrends_click_icon"];
    
    [self setupChildViewController:[[ZDFMeViewController alloc]init] Title:@"我" image:@"tabBar_me_icon" selectedImage:@"tabBar_me_click_icon"];
    
    //使用KVC对tabBar赋值
    [self setValue:[[ZDFTabBar alloc]initWithFrame:self.tabBar.bounds] forKeyPath:@"tabBar"];
    
}

/**
 *  初始化控制器
 *
 *  @param title             文字
 *  @param imageName         未选中
 *  @param selectedImageName 选中
 */
- (void)setupChildViewController:(UIViewController *)vc Title:(NSString *)title image:(NSString *)imageName selectedImage:(NSString *)selectedImageName{
    
    vc.navigationItem.title = title;
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:imageName];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImageName];
    
    //包装导航控制器
    ZDFNavigationController *navi = [[ZDFNavigationController alloc]initWithRootViewController:vc];
    [self addChildViewController:navi];
}

@end
