//
//  ZDFRecommend.m
//  百思不得姐
//
//  Created by apple on 16/3/28.
//  Copyright © 2016年 oxxther. All rights reserved.
//

#import "ZDFRecommendType.h"

@implementation ZDFRecommendType
- (NSMutableArray *)users{
    if (!_users) {
        _users = [NSMutableArray array];
    }
    return _users;
}
@end
