//
//  FillModeViewController.m
//  myiOSAnimation
//
//  Created by 彭益伟 on 7/18/16.
//  Copyright © 2016 pengyiwei. All rights reserved.
//

#import "FillModeViewController.h"

@interface FillModeViewController ()
{
    CABasicAnimation *animation;
    UIView *redView;
}

@end

@implementation FillModeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    redView = [UIView new];
    redView.backgroundColor = [UIColor redColor];
    redView.frame = CGRectMake(50, 150, 100, 100);
    
    [self.view addSubview:redView];
    
    [self setupAnimation];
    
}

- (void)setupAnimation {
    
    NSValue *fromValue = [NSValue valueWithCGPoint:self.view.center];
    NSValue *toValue = [NSValue valueWithCGPoint:CGPointMake(40, 40)];
    
    animation = [CABasicAnimation animationWithKeyPath:@"position"];
    animation.duration = 5;
    animation.fromValue = fromValue;
    animation.toValue = toValue;
    animation.removedOnCompletion = YES;
    animation.fillMode = kCAFillModeBackwards;
    
}

- (IBAction)startBackWardFillMode:(id)sender {
    /**
     kCAFillModeBackwards这个模式和初始状态有关。
     简单来说，假如你需要让这个redView执行位移动画。并且这个redView的center的初始值是(100,100)
     但是执行动画的位移路径是从 屏幕中心 -> (0,0)
     也就是说，动画的初始位置和layer本身的位置是不一致的，那么一旦当这个layer添加了这个动画之后，layer的position会立刻变成动画里的初始值
     而不再是自己本身的位置。
     */
    [redView.layer removeAllAnimations];
    animation.fillMode = kCAFillModeBackwards;
    animation.beginTime = CACurrentMediaTime() + 1.5;
    [redView.layer addAnimation:animation forKey:@"positionAnimation"];
    
}

- (IBAction)startForwardFillMode:(id)sender {
    /**
     kCAFillModeForwards这个模式就很容易理解了，就是当动画执行完毕之后，layer的状态保持在动画执行完的状态。
     */
    [redView.layer removeAllAnimations];
    animation.fillMode = kCAFillModeForwards;
    animation.beginTime = CACurrentMediaTime() + 1;
    [redView.layer addAnimation:animation forKey:@"positionAnimation"];
    redView.center = CGPointMake(40, 40);
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    if (flag) {
        NSLog(@"red view rect is %@", NSStringFromCGRect(redView.frame));
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
