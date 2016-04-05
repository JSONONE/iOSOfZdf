//
//  UIBarButtonItem+ZDFExtension.m
//  百思不得姐
//
//  Created by 业余班 on 16/3/27.
//  Copyright © 2016年 oxxther. All rights reserved.
//

#import "UIBarButtonItem+ZDFExtension.h"

@implementation UIBarButtonItem (ZDFExtension)

+ (instancetype)itemWithImage:(NSString *)imageName highImage:(NSString *)highImageName target:(id)taget action:(SEL)action{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:highImageName] forState:UIControlStateHighlighted];
    button.size = button.currentBackgroundImage.size;
    [button addTarget:taget action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [[self alloc]initWithCustomView:button];
}

@end
