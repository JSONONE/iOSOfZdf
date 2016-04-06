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
 *  图片的宽度
 */
@property (nonatomic,assign) CGFloat width;
/**
 *  图片的高度
 */
@property (nonatomic,assign) CGFloat height;
/**
 *  小图片的url
 */
@property (nonatomic,copy) NSString *small_image;
/**
 *  大图片的url
 */
@property (nonatomic,copy) NSString *large_image;
/**
 *  中图片的url
 */
@property (nonatomic,copy) NSString *middle_image;
/**
 *  topic类型
 */
@property (nonatomic,assign) ZDFBaseType type;

/**
 *  额外的辅助属性
 */
@property (nonatomic,assign,readonly) CGFloat cellHeight;
/**
 *  图片控件的frame
 */
@property (nonatomic,assign,readonly) CGRect pictureViewFrame;
/**
 *  图片是否太大
 */
@property (nonatomic,assign,getter=isBig) BOOL big;
@end
