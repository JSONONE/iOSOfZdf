//
//  ZDFTagModel.h
//  百思不得姐
//
//  Created by apple on 16/3/31.
//  Copyright © 2016年 oxxther. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZDFTagModel : NSObject
/**
*  图片
*/
@property (nonatomic,copy) NSString *image_list;
/**
 *  名称
 */
@property (nonatomic,copy) NSString *theme_name;
/**
 *  订阅数
 */
@property (nonatomic,assign) NSInteger sub_number;

@end
