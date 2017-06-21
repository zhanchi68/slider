//
//  centerViewController.m
//  slider
//
//  Created by 殷云鹏 on 17/2/21.
//  Copyright © 2017年 XinZhongXin. All rights reserved.
//

#import "centerViewController.h"

@interface centerViewController ()

@end

@implementation centerViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor purpleColor];
    self.navigationItem.title = @"中心";
    self.navigationController.navigationItem.title = @"中心";
    UIButton *button = [UIButton buttonWithType:UIButtonTypeContactAdd];
    button.frame = CGRectMake(100, 100, 100, 100);
    [self.view addSubview:button];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
