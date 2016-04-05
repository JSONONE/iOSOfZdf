//
//  ZDFUserCell.m
//  百思不得姐
//
//  Created by apple on 16/3/28.
//  Copyright © 2016年 oxxther. All rights reserved.
//

#import "ZDFUserCell.h"
#import "ZDFRecommendUser.h"
#import <UIImageView+WebCache.h>

@interface ZDFUserCell ()
@property (weak, nonatomic) IBOutlet UIImageView *headerImageView;
@property (weak, nonatomic) IBOutlet UILabel *screenNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *fansCountLabel;

@end

@implementation ZDFUserCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setUser:(ZDFRecommendUser *)user{
    _user = user;
    
    [self.headerImageView sd_setImageWithURL:[NSURL URLWithString:user.header] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
    self.screenNameLabel.text = user.screen_name;
    
    NSString *fansCount = nil;
    if (user.fans_count < 10000) {
        fansCount = [NSString stringWithFormat:@"%ld人关注",(long)user.fans_count];
    }else{
        fansCount = [NSString stringWithFormat:@"%.1f万人关注",user.fans_count/10000.];
    }
    
    self.fansCountLabel.text = fansCount;
}

@end
