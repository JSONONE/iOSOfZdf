//
//  ZDFTopic.h
//  百思不得姐
//
//  Created by apple on 16/4/2.
//  Copyright © 2016年 oxxther. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZDFTopic : NSObject
/**
 *  昵称
 */
@property (nonatomic,copy) NSString *name;
/**
*  头像
*/
@property (nonatomic,copy) NSString *profile_image;
/**
 *  发帖时间
 */
@property (nonatomic,copy) NSString *create_time;
/**
 *  文字内容
 */
@property (nonatomic,copy) NSString *text;
/**
 *  顶
 */
@property (nonatomic,assign) NSInteger ding;
/**
 *  踩
 */
@property (nonatomic,assign) NSInteger cai;
/**
 *  转发
 */
@property (nonatomic,assign) NSInteger repost;
/**
 *  评论
 */
@property (nonatomic,assign) NSInteger comment;
/**
 *  新浪加V
 */
@property (nonatomic,assign,getter=isSina_v) BOOL sina_v;


/**
 *  额外的辅助属性
 */
@property (nonatomic,assign,readonly) CGFloat cellHeight;
@end
