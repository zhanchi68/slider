//
//  BLNavigationController.h
//  SynjonesUP
//
//  Created by Objective on 16/7/14.
//  Copyright © 2016年 Synjones. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface BLNavigationController : UINavigationController

/** 导航栏背景色 */
@property (strong, nonatomic) UIColor *navigationBGColor;

- (void)changeNavigationBar:(CGFloat)alpha;

- (void)hideNavigationBar:(BOOL)hide;














@end
