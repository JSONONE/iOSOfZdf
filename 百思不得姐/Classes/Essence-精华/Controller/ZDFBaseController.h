//
//  ZDFBaseController.h
//  百思不得姐
//
//  Created by apple on 16/4/5.
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

@interface ZDFBaseController : UITableViewController

/**
 *  帖子类型
 */
@property (nonatomic,assign) ZDFBaseType type;
@end
