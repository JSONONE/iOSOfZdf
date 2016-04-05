//
//  ZDFRecommendCategoriesCell.m
//  百思不得姐
//
//  Created by apple on 16/3/28.
//  Copyright © 2016年 oxxther. All rights reserved.
//

#import "ZDFRecommendCategoriesCell.h"
#import "ZDFRecommendType.h"

@interface ZDFRecommendCategoriesCell ()

@property (weak, nonatomic) IBOutlet UIView *selectedIndicator;


@end

@implementation ZDFRecommendCategoriesCell

- (void)awakeFromNib {
    self.backgroundColor = ZDFRGBColor(244, 244, 244);
    self.selectedIndicator.backgroundColor = ZDFRGBColor(216, 21, 26);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    self.selectedIndicator.hidden = !selected;
    self.textLabel.textColor = selected ? self.selectedIndicator.backgroundColor : ZDFRGBColor(80, 80, 80);
    
}

- (void)setType:(ZDFRecommendType *)type{
    _type = type;
    self.textLabel.text = type.name;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    self.textLabel.y = 2;
    self.textLabel.height = self.height - 2 * self.textLabel.y;
}
@end
