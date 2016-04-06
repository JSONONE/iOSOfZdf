//
//  ZDFTopic.m
//  百思不得姐
//
//  Created by apple on 16/4/2.
//  Copyright © 2016年 oxxther. All rights reserved.
//

#import "ZDFTopic.h"
#import <MJExtension.h>

@interface ZDFTopic ()
{
     CGFloat _cellHeight;
     CGRect _pictureViewFrame;
}
@end

@implementation ZDFTopic

+ (NSDictionary *)mj_replacedKeyFromPropertyName{
     return @{
              @"small_image":@"image0",
              @"large_image":@"image1",
              @"middle_image":@"image2"
              };
}

- (CGFloat)cellHeight{
    
    if (!_cellHeight) {
        CGSize maxSize = CGSizeMake([UIScreen mainScreen].bounds.size.width - 4 * ZDFTopicCellMargin, MAXFLOAT);
        //计算文字高度
        CGFloat textH = [self.text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} context:nil].size.height;
        
        _cellHeight = ZDFTopicCellTextY + textH + ZDFTopicCellMargin * 2 + ZDFTopicCellBottomBarH;

         //根据topic的类型来判断
         if (self.type == ZDFBaseTypePicture) {
              CGFloat imageW = maxSize.width;
              CGFloat imageH = imageW * self.height / self.width;
              
              if (imageH >= ZDFTopicCellPictureMaxH) {
                   imageH = ZDFTopicCellPictureFixH;
                   self.big = YES;
              }
              
              CGFloat imageX = ZDFTopicCellMargin;
              CGFloat imageY = ZDFTopicCellTextY + textH + ZDFTopicCellMargin;
              _pictureViewFrame = CGRectMake(imageX, imageY, imageW, imageH);
              
              _cellHeight += (imageH + ZDFTopicCellMargin);
         }
    }
    
    return _cellHeight;
}

- (NSString *)create_time
{
    // 日期格式化类
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    // 设置日期格式(y:年,M:月,d:日,H:时,m:分,s:秒)
    fmt.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    // 帖子的创建时间
    NSDate *create = [fmt dateFromString:_create_time];
    
    if (create.isThisYear) { // 今年
        if (create.isToday) { // 今天
            NSDateComponents *cmps = [[NSDate date] deltaFrom:create];
            
            if (cmps.hour >= 1) { // 时间差距 >= 1小时
                return [NSString stringWithFormat:@"%zd小时前", cmps.hour];
            } else if (cmps.minute >= 1) { // 1小时 > 时间差距 >= 1分钟
                return [NSString stringWithFormat:@"%zd分钟前", cmps.minute];
            } else { // 1分钟 > 时间差距
                return @"刚刚";
            }
        } else if (create.isYesterday) { // 昨天
            fmt.dateFormat = @"昨天 HH:mm:ss";
            return [fmt stringFromDate:create];
        } else { // 其他
            fmt.dateFormat = @"MM-dd HH:mm:ss";
            return [fmt stringFromDate:create];
        }
    } else { // 非今年
        return _create_time;
    }
}

@end
