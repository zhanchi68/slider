//
//  ViewController.m
//  slider
//
//  Created by 殷云鹏 on 17/2/21.
//  Copyright © 2017年 XinZhongXin. All rights reserved.
//

#import "ViewController.h"
#import "centerViewController.h"
#import "leftCollectionViewController.h"
#define kScreenWidth  [UIScreen mainScreen].bounds.size.width
#define kScreenHight  [UIScreen mainScreen].bounds.size.hight
@interface ViewController ()
@property (nonatomic,strong) UIView *childerView;
@property (nonatomic,assign) CGRect original;
@property (nonatomic,strong) UIView *centerVeiw;
@end

@implementation ViewController

-(UIView *)childerView{
    if (!_childerView) {
        UIView *childerView = [[UIView alloc] initWithFrame:self.view.bounds];
        _childerView = childerView;
    }
    return _childerView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"首页";
    self.view.backgroundColor = [UIColor redColor];
    [self addSubVC];
}
- (void)addSubVC{
    centerViewController *centerVC = [[centerViewController alloc] init];
    centerVC.view.frame = self.view.bounds;
    self.centerVeiw = centerVC.view;
    leftCollectionViewController *leftVC = [[leftCollectionViewController alloc] init];
    UINavigationController *leftNav = [[UINavigationController alloc] initWithRootViewController:leftVC];
    leftVC.view.frame = self.view.bounds;
    [self addChildViewController:leftNav];
//    [self addChildViewController:leftVC];
    [self.childerView addSubview:centerVC.view];
    [self.childerView addSubview:leftVC.view];
    [self.childerView bringSubviewToFront:centerVC.view];
    [self.view addSubview:self.childerView];
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(slideIterface:)];
    [self.view addGestureRecognizer:panGesture];
}

- (void)slideIterface:(UIPanGestureRecognizer *)panGesture {
    switch (panGesture.state) {
        case UIGestureRecognizerStateBegan:{
//            CGPoint slidedistance = [panGesture translationInView:self.view];
//            self.original = self.centerVeiw.frame;
            break;
        }
        case UIGestureRecognizerStateChanged:{
            CGPoint slidedistance = [panGesture translationInView:self.view];
            CGRect newFrame = self.centerVeiw.frame;
            if (slidedistance.x > 0) {
                newFrame.origin.x  = self.original.origin.x + slidedistance.x;
                if (newFrame.origin.x > kScreenWidth*.4) {
                    newFrame.origin.x = kScreenWidth*.4;
                }
                 self.centerVeiw.frame = newFrame;
            }else if (slidedistance.x < 0){
                newFrame.origin.x  += slidedistance.x;
                if (newFrame.origin.x >= 0) {
                    self.centerVeiw.frame = newFrame;
                }
            }
           
            break;
        }
        case UIGestureRecognizerStateEnded:
            
            break;
        case UIGestureRecognizerStateCancelled:

            break;



            
        default:
            break;
    }
}


@end
