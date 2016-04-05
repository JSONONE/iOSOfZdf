//
//  UIView+ZDFViewExtension.h
//  百思不得姐
//
//  Created by apple on 16/3/26.
//  Copyright © 2016年 oxxther. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ZDFViewExtension)
/**
 *  在分类中声明@property,只会生成方法的声明,不会生成方法的实现和带有"_"的成员变量
 */
@property (nonatomic,assign) CGFloat x;
@property (nonatomic,assign) CGFloat y;
@property (nonatomic,assign) CGFloat width;
@property (nonatomic,assign) CGFloat height;
@property (nonatomic,assign) CGSize size;
@property (nonatomic,assign) CGFloat centerX;
@property (nonatomic,assign) CGFloat centerY;
@end
