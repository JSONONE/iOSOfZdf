//
//  ZDFPictureView.h
//  百思不得姐
//
//  Created by apple on 16/4/6.
//  Copyright © 2016年 oxxther. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZDFTopic;
@interface ZDFPictureView : UIView

+ (instancetype)pictureView;

@property (strong,nonatomic) ZDFTopic *topic;
@end
