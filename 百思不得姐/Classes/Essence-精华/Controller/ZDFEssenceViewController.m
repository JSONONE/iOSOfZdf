//
//  ZDFEssenceViewController.m
//  百思不得姐
//
//  Created by apple on 16/3/26.
//  Copyright © 2016年 oxxther. All rights reserved.
//

#import "ZDFEssenceViewController.h"
#import "ZDFRecommendTagsController.h"

#import "ZDFBaseController.h"


@interface ZDFEssenceViewController ()<UIScrollViewDelegate>
@property (nonatomic,weak) UIView *indicatorView;
@property (nonatomic,weak) UIButton *currentBtn;
@property (nonatomic,weak) UIView *titleView;
@property (nonatomic,weak) UIScrollView *contentView;
@end

@implementation ZDFEssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置导航栏
    [self setupNav];
    
    //设置子控制器
    [self setupChildViewController];
    
    //设置顶部的标签栏
    [self setupTitleView];
    
    //设置下边的scrollView
    [self setupContentView];
    
    
}

- (void)setupChildViewController{
    ZDFBaseController *word = [[ZDFBaseController alloc] init];
    word.title = @"段子";
    word.type = ZDFBaseTypeWord;
    [self addChildViewController:word];
    
    ZDFBaseController *all = [[ZDFBaseController alloc] init];
    all.title = @"全部";
    all.type = ZDFBaseTypeAll;
    [self addChildViewController:all];
    
    ZDFBaseController *picture = [[ZDFBaseController alloc] init];
    picture.title = @"图片";
    picture.type = ZDFBaseTypePicture;
    [self addChildViewController:picture];
    
    ZDFBaseController *video = [[ZDFBaseController alloc] init];
    video.title = @"视频";
    video.type = ZDFBaseTypeVideo;
    [self addChildViewController:video];
    
    ZDFBaseController *voice = [[ZDFBaseController alloc] init];
    voice.title = @"声音";
    voice.type = ZDFBaseTypeVoice;
    [self addChildViewController:voice];
}

- (void)setupContentView{
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    UIScrollView *contentView = [[UIScrollView alloc]init];
    contentView.pagingEnabled = YES;
    contentView.bounces = NO;
    contentView.frame = self.view.bounds;
    contentView.delegate = self;
    [self.view insertSubview:contentView atIndex:0];
    
    contentView.contentSize = CGSizeMake(contentView.width * self.childViewControllers.count, 0);
    
    self.contentView = contentView;
    
    //添加第一个控制器view
    [self scrollViewDidEndScrollingAnimation:contentView];
}

- (void)setupTitleView{
    UIView *titleView = [[UIView alloc]init];
    titleView.backgroundColor = [UIColor colorWithWhite:1. alpha:.5];
    titleView.width = self.view.width;
    titleView.height = ZDFTitleViewH;
    titleView.y = ZDFTitleViewY;
    
    [self.view addSubview:titleView];
    self.titleView = titleView;
    
    //底部的红色指示器
    UIView *indicatorView = [[UIView alloc]init];
    indicatorView.backgroundColor = [UIColor redColor];
    indicatorView.height = 2;
    indicatorView.y = titleView.height - indicatorView.height;
    
    self.indicatorView = indicatorView;
    
    //内部的子标签
    
    CGFloat width = titleView.width / self.childViewControllers.count;
    CGFloat height = titleView.height;
    for (NSInteger i=0; i<5; i++) {
        UIButton *button = [[UIButton alloc]init];
        button.tag = i;
        button.width = width;
        button.height = height;
        button.x = i * width;
        [button setTitle:self.childViewControllers[i].title forState:UIControlStateNormal];
        
//        [button layoutIfNeeded];//强制布局
        
        [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateDisabled];
        button.titleLabel.font = [UIFont systemFontOfSize:14];
        [button addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
        [titleView addSubview:button];
        
        //默认点击了第一个按钮
        if (i == 0) {
            button.enabled = NO;
            self.currentBtn = button;
            //让按钮的label算出宽度
            [button.titleLabel sizeToFit];
            self.indicatorView.width = button.titleLabel.width;
//            self.indicatorView.width = [arr[i] sizeWithAttributes:@{NSFontAttributeName:button.titleLabel.font}].width;
            self.indicatorView.centerX = button.centerX;
        }
    }
    
    [titleView addSubview:indicatorView];
}

- (void)titleClick:(UIButton *)btn{
    ZDFLogFunc
    
    self.currentBtn.enabled = YES;
    btn.enabled = NO;
    self.currentBtn = btn;
    
    
    [UIView animateWithDuration:.25 animations:^{
        self.indicatorView.width = btn.titleLabel.width;
        self.indicatorView.centerX = btn.centerX;
    }];
    
    CGPoint offset = self.contentView.contentOffset;
    offset.x = btn.tag * self.contentView.width;
    [self.contentView setContentOffset:offset animated:YES];
}

- (void)setupNav{
    //设置导航栏标题内容
    self.navigationItem.titleView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"MainTitle"]];
    
    //设置左边的按钮
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"MainTagSubIcon" highImage:@"MainTagSubIconClick" target:self action:@selector(tagClick)];
    
    //设置背景色
    self.view.backgroundColor = ZDFGlobalRGBColor;
}

- (void)tagClick{
    ZDFLogFunc
    ZDFRecommendTagsController *tagsC = [[ZDFRecommendTagsController alloc]init];
    [self.navigationController pushViewController:tagsC animated:YES];
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    //当前索引
    NSInteger index = scrollView.contentOffset.x/scrollView.width;
    //取出子控制器
    UIViewController *vc = self.childViewControllers[index];
    vc.view.x = scrollView.contentOffset.x;
    vc.view.y = 0;//设置控制器view的y(默认20)
    vc.view.height = scrollView.height;
    [scrollView addSubview:vc.view];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    [self scrollViewDidEndScrollingAnimation:scrollView];
    
    NSInteger index = scrollView.contentOffset.x / scrollView.width;
    
    [self titleClick:self.titleView.subviews[index]];
}
@end
