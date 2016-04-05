//
//  ZDFLoginRegisterController.m
//  百思不得姐
//
//  Created by apple on 16/4/1.
//  Copyright © 2016年 oxxther. All rights reserved.
//

#import "ZDFLoginRegisterController.h"

@interface ZDFLoginRegisterController ()
@property (weak, nonatomic) IBOutlet UITextField *phone;
@property (weak, nonatomic) IBOutlet UITextField *password;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *loginLeftConstraint;
@end

@implementation ZDFLoginRegisterController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /**
     *  第一种 - 属性
     */
//    NSDictionary *attr = @{NSForegroundColorAttributeName:[UIColor grayColor]};
//    
//    NSMutableAttributedString *string = [[NSMutableAttributedString alloc]initWithString:@"手机号" attributes:attr];
//    
//    self.phone.attributedPlaceholder = string;
    /**
     *  第二种 - 方法
     */

}
- (IBAction)clickLoginOrRegister:(UIButton *)sender {
    [self.view endEditing:YES];
    
    if (self.loginLeftConstraint.constant == 0.) {
        self.loginLeftConstraint.constant = - self.view.width;
        [sender setTitle:@"已有账号?" forState:UIControlStateNormal];
    }else{
        self.loginLeftConstraint.constant = 0.;
       [sender setTitle:@"注册账号" forState:UIControlStateNormal];
    }

    [UIView animateWithDuration:.25 animations:^{
        [self.view layoutIfNeeded];
    }];
    
}

- (IBAction)back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

/**
 * 控制器的状态栏的色系控制
 */
- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}
@end
