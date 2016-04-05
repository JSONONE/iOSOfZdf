//
//  ZDFCustomTextField.m
//  百思不得姐
//
//  Created by apple on 16/4/1.
//  Copyright © 2016年 oxxther. All rights reserved.
//

#import "ZDFCustomTextField.h"

#import <objc/runtime.h>

@implementation ZDFCustomTextField

static NSString * const TFPlaceholderColorKeyPath = @"_placeholderLabel.textColor";

/*
+ (void)initialize{
    unsigned int count = 0;
    //拷贝出所有的成员变量
    Ivar *ivars = class_copyIvarList([UITextField class], &count);
    
    for (int i=0; i<count; i++) {
        //取出成员变量
        Ivar ivar = *(ivars + i);
        //打印成员变量
        ZDFLog(@"%s",ivar_getName(ivar));
    }
    
    //释放
    free(ivars);
}
*/
 
- (void)awakeFromNib{
    
    self.tintColor = self.textColor;
    
    //不成为第一响应者
    [self resignFirstResponder];
}

- (void)setPlaceholderColor:(UIColor *)placeholderColor{
    _placeholderColor = placeholderColor;
    [self setValue:self.textColor forKeyPath:TFPlaceholderColorKeyPath];
}

/**
 *  聚焦时调用
 *
 */
- (BOOL)becomeFirstResponder{
    [self setValue:[UIColor whiteColor] forKeyPath:TFPlaceholderColorKeyPath];
    return [super becomeFirstResponder];
}

- (BOOL)resignFirstResponder{
    [self setValue:[UIColor grayColor] forKeyPath:TFPlaceholderColorKeyPath];
    return [super resignFirstResponder];
}
//- (void)drawPlaceholderInRect:(CGRect)rect{
//    [self.placeholder drawInRect:CGRectMake(0, 10, rect.size.width, rect.size.height) withAttributes:@{NSForegroundColorAttributeName:[UIColor grayColor],NSFontAttributeName: self.font                             }];
//    
//}

/**
 *  运行时(runtime) - 底层操作
 */


@end
