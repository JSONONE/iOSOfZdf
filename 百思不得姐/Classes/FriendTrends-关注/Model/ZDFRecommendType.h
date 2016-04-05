//
//  ZDFRecommend.h
//  百思不得姐
//
//  Created by apple on 16/3/28.
//  Copyright © 2016年 oxxther. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZDFRecommendType : NSObject

/** id */
@property (nonatomic,assign) NSInteger id;
/** count */
@property (nonatomic,assign) NSInteger count;
/** name */
@property (nonatomic,copy) NSString* name;
/** 管理下属模型 */
@property (nonatomic,strong) NSMutableArray *users;

/** 总数 */
@property (nonatomic,assign) NSInteger total;
/** 当前页码 */
@property (nonatomic,assign) NSInteger currentPage;

@end
