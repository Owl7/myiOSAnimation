//
//  SequenceAnimationViewController.m
//  myiOSAnimation
//
//  Created by 彭益伟 on 7/20/16.
//  Copyright © 2016 pengyiwei. All rights reserved.
//

#import "SequenceAnimationViewController.h"

@interface SequenceAnimationViewController ()
{
    NSMutableArray *sequencePositonArray;
    NSMutableArray *sequenceViewArray;
}

@end

@implementation SequenceAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    sequencePositonArray = [NSMutableArray array];
    sequenceViewArray = [NSMutableArray array];
    NSArray *colorArray = @[[UIColor blueColor], [UIColor redColor], [UIColor purpleColor], [UIColor yellowColor], [UIColor blueColor], [UIColor blackColor], [UIColor grayColor], [UIColor orangeColor]];
    CGFloat centerX = self.view.center.x;
    CGFloat centerY = self.view.center.y;
    
    CGFloat delta = 2*M_PI/8;
    
    CGFloat x = centerX + 50 * cos(delta * 7);
    CGFloat y = centerY + 50 * sin(delta * 7);
    
    [sequencePositonArray addObject:[NSValue valueWithCGPoint:CGPointMake(x, y)]];
    
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
    view1.center = self.view.center;
    view1.backgroundColor = colorArray[0];
    view1.layer.cornerRadius = 5;
    view1.layer.masksToBounds = YES;
    view1.layer.transform = CATransform3DMakeScale(0, 0, 0);
    [self.view addSubview:view1];
    
    [sequenceViewArray addObject:view1];
    
    for (int i = 0; i < 7; i++) {
        CGFloat x = centerX + 50 * cos(delta * i);
        CGFloat y = centerY + 50 * sin(delta * i);
        [sequencePositonArray addObject:[NSValue valueWithCGPoint:CGPointMake(x, y)]];
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
        view.center = self.view.center;
        view.backgroundColor = colorArray[i + 1];
        view.layer.transform = CATransform3DMakeScale(0, 0, 0);
        view.layer.masksToBounds = YES;
        [self.view addSubview:view];
        
        [sequenceViewArray addObject:view];
        
    }
    
}

- (CAAnimationGroup *)createGroupAnimationWithDelay:(CFTimeInterval)time withIndex:(NSInteger)index {
    CABasicAnimation *moveAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
    moveAnimation.fromValue = [NSValue valueWithCGPoint:self.view.center];
    moveAnimation.toValue = sequencePositonArray[index];
//    moveAnimation.beginTime = 0;
    moveAnimation.duration = 0.75;
    moveAnimation.autoreverses = YES;
//    return moveAnimation;
    
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.fromValue = @(0);
    scaleAnimation.toValue = @(1);
    scaleAnimation.duration = 0.75;
    scaleAnimation.autoreverses = YES;
//    return scaleAnimation;
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations = @[moveAnimation, scaleAnimation];
    group.autoreverses = YES;
    group.duration = 0.75;
    group.repeatCount = HUGE_VALF;
    group.beginTime = CACurrentMediaTime() + time;
    
    return group;
}

- (IBAction)startAnimation:(id)sender {
    for (int i = 0; i < sequenceViewArray.count; i++) {
        UIView *view = sequenceViewArray[i];
        [view.layer addAnimation:[self createGroupAnimationWithDelay:i*0.1 withIndex:i] forKey:@"group"];
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
