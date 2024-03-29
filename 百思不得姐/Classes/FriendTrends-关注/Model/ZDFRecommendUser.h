//
//  ZDFRecommendUser.h
//  百思不得姐
//
//  Created by apple on 16/3/28.
//  Copyright © 2016年 oxxther. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZDFRecommendUser : NSObject
/** 头像 */
@property (nonatomic,copy) NSString* header;
/** 粉丝数 */
@property (nonatomic,assign) NSInteger fans_count;
/** 昵称 */
@property (nonatomic,copy) NSString* screen_name;
@end
