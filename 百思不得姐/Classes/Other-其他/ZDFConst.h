//
//  ZDFConst.h
//  百思不得姐
//
//  Created by apple on 16/4/2.
//  Copyright © 2016年 oxxther. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef enum {
    ZDFBaseTypeAll = 1,
    ZDFBaseTypePicture = 10,
    ZDFBaseTypeWord = 29,
    ZDFBaseTypeVoice = 31,
    ZDFBaseTypeVideo = 41
}ZDFBaseType;


UIKIT_EXTERN CGFloat const ZDFTitleViewH;
UIKIT_EXTERN CGFloat const ZDFTitleViewY;
/**
 *  文字内容Y值
 */
UIKIT_EXTERN CGFloat const ZDFTopicCellTextY;
/**
 *  cell中底部bar高度
 */
UIKIT_EXTERN CGFloat const ZDFTopicCellBottomBarH;
/**
 *  cell的间距
 */
UIKIT_EXTERN CGFloat const ZDFTopicCellMargin;
/**
 *  图片帖子的最大高度
 */
UIKIT_EXTERN CGFloat const ZDFTopicCellPictureMaxH;
/**
 *  图片帖子的固定高度
 */
UIKIT_EXTERN CGFloat const ZDFTopicCellPictureFixH;