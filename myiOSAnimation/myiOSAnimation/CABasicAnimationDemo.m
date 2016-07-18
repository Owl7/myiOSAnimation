//
//  CABasicAnimationDemo.m
//  myiOSAnimation
//
//  Created by 彭益伟 on 7/18/16.
//  Copyright © 2016 pengyiwei. All rights reserved.
//

#import "CABasicAnimationDemo.h"

#define DEGREES_TO_RADIANS(degrees)((M_PI * degrees)/180)

NSString * const kXAxisTransform = @"transform.rotation.x";
NSString * const kYAxisTransform = @"transform.rotation.x";
NSString * const kZAxisTransform = @"transform.rotation.x";

static CGFloat const kAnimationDuration = 1;

@implementation CABasicAnimationDemo

+ (CABasicAnimation *)animationWithKeyPath:(NSString *)keyPath
                                  duration:(CFTimeInterval)duration
                                 fromValue:(id)from
                                   toValue:(id)to {
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:keyPath];
    
    animation.duration = duration;
    animation.fromValue = from;
    animation.toValue = to;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
//    animation.fillMode = kCAFillModeBackwards;
    
    return animation;
}

+ (CABasicAnimation *)shadowOffsetAnimation:(BOOL)open {
    NSValue *fromValue = [NSValue valueWithCGSize:CGSizeMake(0, 0)];
    NSValue *toValue = [NSValue valueWithCGSize:CGSizeMake(15, 15)];
    if (open) {
        return [CABasicAnimationDemo animationWithKeyPath:@"shadowOffset" duration:kAnimationDuration fromValue:fromValue toValue:toValue];
    } else {
        return [CABasicAnimationDemo animationWithKeyPath:@"shadowOffset" duration:kAnimationDuration fromValue:toValue toValue:fromValue];
    }
}

+ (CABasicAnimation *)shadowColorAnimation:(BOOL)open {
    id fromColor = (id)[UIColor blackColor].CGColor;
    id toColor = (id)[UIColor redColor].CGColor;
    if (open) {
        return [CABasicAnimationDemo animationWithKeyPath:@"shadowColor" duration:kAnimationDuration fromValue:fromColor toValue:toColor];
    } else {
        return [CABasicAnimationDemo animationWithKeyPath:@"shadowColor" duration:kAnimationDuration fromValue:toColor toValue:fromColor];
    }
}

+ (CABasicAnimation *)transformAxisAnimationforLayer:(CALayer *)layer withAxis:(NSString *)axis withDegrees:(CGFloat)degrees withAnchorPoit:(CGPoint)anchorPoint withPerspective:(BOOL)isPerspective {
    if (isPerspective) {
        CATransform3D transform = CATransform3DIdentity;
        transform.m34 = -1.0/500;
        layer.transform = transform;
    } else {
        layer.transform = CATransform3DIdentity;
    }
    
    layer.anchorPoint = anchorPoint;
    CABasicAnimation *animation = [CABasicAnimationDemo animationWithKeyPath:axis duration:kAnimationDuration fromValue:0 toValue:@(DEGREES_TO_RADIANS(degrees))];
    animation.removedOnCompletion = YES;
    animation.autoreverses = NO;
    
    return animation;
}

+ (CABasicAnimation *)shapePathAnimationWithFromPath:(UIBezierPath *)fromPath toPath:(UIBezierPath *)toPath reverse:(BOOL)isReverse {
    if (isReverse) {
        return [CABasicAnimationDemo animationWithKeyPath:@"path" duration:kAnimationDuration fromValue:(id)fromPath.CGPath toValue:(id)toPath.CGPath];
    } else {
        return [CABasicAnimationDemo animationWithKeyPath:@"path" duration:kAnimationDuration fromValue:(id)toPath.CGPath toValue:(id)fromPath.CGPath];
    }
}
















@end
