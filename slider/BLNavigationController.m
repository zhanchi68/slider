//
//  BLNavigationController.m
//  SynjonesUP
//
//  Created by Objective on 16/7/14.
//  Copyright © 2016年 Synjones. All rights reserved.
//

#import "BLNavigationController.h"


#define kBGViewTag  1000
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kNavHeight 64
@interface BLNavigationController () <UIGestureRecognizerDelegate>

@property (strong, nonatomic) UIView *bgview;

@end

@implementation BLNavigationController

#pragma mark - 懒加载

- (UIView *)bgview {
    if (!_bgview) {
        _bgview = [[UIView alloc] init];
        
        _bgview.frame = CGRectMake(0, 0, kScreenWidth, kNavHeight);
//        [_bgview addLineViewWithColor:kColorDF top:NO];
        _bgview.tag = kBGViewTag;
        [[self.navigationBar.subviews firstObject] insertSubview:_bgview atIndex:0];
    }
    return _bgview;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configUIF];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    [self.topViewController.view endEditing:YES];
    [super pushViewController:viewController animated:animated];
}

- (void)configUIF {
    self.interactivePopGestureRecognizer.delegate = self;
    self.navigationBar.tintColor = [UIColor whiteColor];
    //  关闭导航栏半透明效果
//    self.navigationBar.translucent = NO;
    //  设置导航栏背景图片为空
    [self.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.navigationBar setShadowImage:[UIImage new]];
    self.navigationBar.backgroundColor = [UIColor clearColor];
    [[self.navigationBar.subviews firstObject] setBackgroundColor:[UIColor clearColor]];

    self.navigationBar.tintColor = [UIColor purpleColor];


//    self.navigationBar.tintColor = kColor90CD3C;

    //  设置导航栏字体颜色和大小
    self.navigationBar.titleTextAttributes = @{
                                               NSFontAttributeName : [UIFont boldSystemFontOfSize:14],
                                               NSForegroundColorAttributeName : [UIColor whiteColor]
                                               };
//    self.bgview.backgroundColor = kColorNaviBG;
    self.bgview.backgroundColor = [UIColor blueColor];

}

- (void)setNavigationBGColor:(UIColor *)navigationBGColor {
    self.bgview.backgroundColor = navigationBGColor;
}

- (void)hideNavigationBar:(BOOL)hide {
    self.bgview.hidden = hide;
    if (hide) {
        [self changeNavigationBar:0];
    } else {
        self.bgview.hidden = NO;
        self.bgview.backgroundColor = [UIColor blueColor];
        self.navigationBar.titleTextAttributes = @{
                                                   NSFontAttributeName : [UIFont boldSystemFontOfSize:14],
                                                   NSForegroundColorAttributeName : [UIColor whiteColor]
                                                   };
    }
}

- (void)changeNavigationBar:(CGFloat)alpha {
    
//    UIColor *navBGColor = [UIColor colorWithRed:0.565 green:0.804 blue:0.235 alpha:alpha];
    self.bgview.hidden = !alpha;
    [self.bgview setBackgroundColor:[UIColor blueColor]];
    self.navigationBar.titleTextAttributes = @{
                                               NSFontAttributeName : [UIFont boldSystemFontOfSize:14],
                                               NSForegroundColorAttributeName : [UIColor whiteColor]
                                               };
}




@end
