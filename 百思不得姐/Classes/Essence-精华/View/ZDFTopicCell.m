//
//  ZDFTopicCell.m
//  百思不得姐
//
//  Created by apple on 16/4/2.
//  Copyright © 2016年 oxxther. All rights reserved.
//

#import "ZDFTopicCell.h"
#import "ZDFTopic.h"
#import <UIImageView+WebCache.h>


@interface ZDFTopicCell ()
@property (weak, nonatomic) IBOutlet UIImageView *headerImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIButton *ding;
@property (weak, nonatomic) IBOutlet UIButton *cai;
@property (weak, nonatomic) IBOutlet UIButton *fenxiang;
@property (weak, nonatomic) IBOutlet UIButton *pinglun;
@property (weak, nonatomic) IBOutlet UIImageView *sina_vImage;

@end


@implementation ZDFTopicCell

- (void)awakeFromNib{
    UIImageView *bgView = [[UIImageView alloc]init];
    bgView.image = [UIImage imageNamed:@"mainCellBackground"];
    self.backgroundView = bgView;
}

- (void)setTopic:(ZDFTopic *)topic{
    _topic = topic;
    
    topic.sina_v = (int)arc4random_uniform(10)%2;
    
    [self.headerImage sd_setImageWithURL:[NSURL URLWithString:topic.profile_image]];
    self.nameLabel.text = topic.name;
    self.timeLabel.text = topic.create_time;
    self.sina_vImage.hidden = !topic.isSina_v;
    // 设置按钮文字
    [self setupButtonTitle:self.ding count:topic.ding placeholder:@"顶"];
    [self setupButtonTitle:self.cai count:topic.cai placeholder:@"踩"];
    [self setupButtonTitle:self.fenxiang count:topic.repost placeholder:@"分享"];
    [self setupButtonTitle:self.pinglun count:topic.comment placeholder:@"评论"];
}

/**
 * 设置底部按钮文字
 */
- (void)setupButtonTitle:(UIButton *)button count:(NSInteger)count placeholder:(NSString *)placeholder
{
    if (count > 10000) {
        placeholder = [NSString stringWithFormat:@"%.1f万", count / 10000.0];
    } else if (count > 0) {
        placeholder = [NSString stringWithFormat:@"%zd", count];
    }
    [button setTitle:placeholder forState:UIControlStateNormal];
}

- (void)setFrame:(CGRect)frame{
    static CGFloat margin = 10;
    
    frame.origin.x = margin;
    frame.size.width -= 2*frame.origin.x;
    frame.size.height -=margin;
    frame.origin.y += margin;
    
    [super setFrame:frame];
}

@end
