//
//  ZDFTagsCell.m
//  百思不得姐
//
//  Created by apple on 16/3/31.
//  Copyright © 2016年 oxxther. All rights reserved.
//

#import "ZDFTagsCell.h"
#import "ZDFTagModel.h"
#import <UIImageView+WebCache.h>


@interface ZDFTagsCell ()

@property (weak, nonatomic) IBOutlet UIImageView *listImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@end

@implementation ZDFTagsCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setRecommendTags:(ZDFTagModel *)recommendTags{
    _recommendTags = recommendTags;
    [self.listImageView sd_setImageWithURL:[NSURL URLWithString:recommendTags.image_list] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
    self.nameLabel.text = recommendTags.theme_name;
    
    NSString *sub_number = nil;
    if (recommendTags.sub_number < 10000) {
        sub_number = [NSString stringWithFormat:@"%ld人订阅",(long)recommendTags.sub_number];
    }else{
        sub_number = [NSString stringWithFormat:@"%.1f万人订阅",recommendTags.sub_number/10000.];
    }
    self.numberLabel.text = sub_number;
}

- (void)setFrame:(CGRect)frame{
    ZDFLog(@"setFrame --- %@",NSStringFromCGRect(frame));
    
    frame.origin.x = 5;
    
    frame.size.width -= frame.origin.x * 2;
    
    frame.size.height -= 1;
    [super setFrame:frame];
}
@end
