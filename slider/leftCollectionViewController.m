//
//  leftCollectionViewController.m
//  slider
//
//  Created by 殷云鹏 on 17/2/21.
//  Copyright © 2017年 XinZhongXin. All rights reserved.
//

#import "leftCollectionViewController.h"

@interface leftCollectionViewController ()

@end

@implementation leftCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    self.title = @"侧";
    self.navigationController.navigationBar.backgroundColor = [UIColor lightGrayColor];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeContactAdd];
    button.frame = CGRectMake(50, 100, 100, 100);
    [self.view addSubview:button];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
