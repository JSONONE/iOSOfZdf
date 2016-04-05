//
//  ZDFTabBar.m
//  百思不得姐
//
//  Created by apple on 16/3/26.
//  Copyright © 2016年 oxxther. All rights reserved.
//

#import "ZDFTabBar.h"

@interface ZDFTabBar ()
@property (nonatomic,weak) UIButton *publishBtn;
@end

@implementation ZDFTabBar
/**
 *  加入按钮
 */
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self != nil) {
        //设置背景图片
        [self setBackgroundImage:[UIImage imageNamed:@"tabbar-light"]];
        
        //添加发布按钮
        UIButton *publishBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [publishBtn setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [publishBtn setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateHighlighted];
        publishBtn.size = publishBtn.currentBackgroundImage.size;
        [self addSubview:publishBtn];
        self.publishBtn = publishBtn;
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    CGFloat width = self.width;
    CGFloat height = self.height;
    
    //设定按钮的位置
    self.publishBtn.center = CGPointMake(width * .5, height * .5);
    
    //调整UITabBarButton的位置
    CGFloat btnY = 0;
    CGFloat btnW = width / 5.;
    CGFloat btnH = height;
    NSInteger index = 0 ;
    for (UIView *btn in self.subviews) {
//        if (![btn isKindOfClass:NSClassFromString(@"UITabBarButton")])continue;
        if (![btn isKindOfClass:[UIControl class]] || btn == self.publishBtn)continue;
        CGFloat btnX = (index > 1 ? index + 1: index) * btnW;
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
        index ++;
    }
}

@end
