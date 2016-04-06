//
//  ZDFPictureView.m
//  百思不得姐
//
//  Created by apple on 16/4/6.
//  Copyright © 2016年 oxxther. All rights reserved.
//

#import "ZDFPictureView.h"
#import "ZDFTopic.h"
#import <UIImageView+WebCache.h>

@interface ZDFPictureView ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIImageView *gifView;
@property (weak, nonatomic) IBOutlet UIButton *clickView;

@end

@implementation ZDFPictureView

+ (instancetype)pictureView{
    return [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil ] firstObject];
}

- (void)awakeFromNib{
    /**
     *  autoresizing拉伸控件的尺寸
     */
    self.autoresizingMask = UIViewAutoresizingNone;
}

- (void)setTopic:(ZDFTopic *)topic{
    _topic = topic;
    
    /**
     *  在不知道图片的扩展名,如何知道图片的真实类型?
     *  取出图片数据第一个字节,代表图片类型
     */
    
    
    /**
     *  IamgeIO - GIF 解析成 n个UIImage
     *  使用UIView帧动画
     */
    
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:topic.large_image]];
    
    //判断是否为gif
    NSString *extension = topic.large_image.pathExtension;
    self.gifView.hidden = ![extension.lowercaseString isEqualToString:@"gif"];
    
    //判断是否显示button
    if (topic.isBig) {
        self.clickView.hidden = NO;
        self.imageView.contentMode = UIViewContentModeScaleAspectFill;
    }else{
        self.clickView.hidden = YES;
        self.imageView.contentMode = UIViewContentModeScaleToFill;
    }
    
}
@end
