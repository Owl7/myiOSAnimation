//
//  MaskAnimationViewController.m
//  myiOSAnimation
//
//  Created by 彭益伟 on 7/14/16.
//  Copyright © 2016 pengyiwei. All rights reserved.
//

/**
 
 主要展示Mask动画和动画暂停，继续。
 用作mask的layer必须是cashapelayer。不然无效
 
 */

#import "MaskAnimationViewController.h"

static CGFloat const kImageViewWith = 104;
static CGFloat const kImageViewHeight = 157;

@interface MaskAnimationViewController ()
{
    BOOL isAnimating;
    CAShapeLayer *maskLayer;
}

@property (weak, nonatomic) IBOutlet UIImageView *topImageView;
@property (weak, nonatomic) IBOutlet UIImageView *bottomImageView;

@end

@implementation MaskAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect rect = CGRectMake(0, 0, kImageViewWith, kImageViewHeight);
    maskLayer = [CAShapeLayer layer];
    maskLayer.path = [UIBezierPath bezierPathWithRect:rect].CGPath;
    
    _topImageView.layer.mask = maskLayer;
    
}

#pragma mark - Animation Control

- (IBAction)startAnimation:(id)sender {
    isAnimating = YES;
    CGRect rect = CGRectMake(0, 0, kImageViewWith, kImageViewHeight);
    UIBezierPath *fromPath = [UIBezierPath bezierPathWithRect:rect];
    UIBezierPath *toPath = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, kImageViewWith, 0)];
    maskLayer.path = fromPath.CGPath;
    maskLayer.speed = 1;
    [maskLayer removeAllAnimations];
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    basicAnimation.fromValue = (id)(fromPath.CGPath);
    basicAnimation.toValue = (id)(toPath.CGPath);
    basicAnimation.duration = 5;
    [maskLayer addAnimation:basicAnimation forKey:@"pathAnimation"];
    maskLayer.path = toPath.CGPath;
}

- (IBAction)pauseAnimation:(id)sender {
    isAnimating = NO;
    CFTimeInterval pausedTime = [maskLayer convertTime:CACurrentMediaTime() fromLayer:nil];
    maskLayer.speed = 0;
    maskLayer.timeOffset = pausedTime;
}

- (IBAction)resumeAnimation:(id)sender {
    if (isAnimating) {
        return;
    }
    isAnimating = YES;
    CFTimeInterval pausedTime = maskLayer.timeOffset;
    maskLayer.speed = 1.0;
    maskLayer.timeOffset = 0;
    maskLayer.beginTime = 0;
    CFTimeInterval timeSincePause = [maskLayer convertTime:CACurrentMediaTime() fromLayer:nil] - pausedTime;
    maskLayer.beginTime = timeSincePause;
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
