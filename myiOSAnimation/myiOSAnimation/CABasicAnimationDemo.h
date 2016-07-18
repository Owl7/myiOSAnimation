//
//  CABasicAnimationDemo.h
//  myiOSAnimation
//
//  Created by 彭益伟 on 7/18/16.
//  Copyright © 2016 pengyiwei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

FOUNDATION_EXPORT NSString * const kXAxisTransform;
FOUNDATION_EXPORT NSString * const kYAxisTransform;
FOUNDATION_EXPORT NSString * const kZAxisTransform;

/**
 'CABasicAnimationDemo这个类'列举了一系列keypath的动画。
 */
@interface CABasicAnimationDemo : NSObject

/**
 阴影偏移量动画，通常用来实现点击之后由平面显示为3D的效果。
 */
+ (CABasicAnimation *)shadowOffsetAnimation:(BOOL)open;

/**
 阴影颜色动画。
 */
+ (CABasicAnimation *)shadowColorAnimation:(BOOL)open;

/**
 轴旋转动画,不设置透视（perspective）那么旋转没有3D效果,可以尝试修改anchorpoint的值看看效果。
 */
+ (CABasicAnimation *)transformAxisAnimationforLayer:(CALayer *)layer
                                            withAxis:(NSString *)axis
                                         withDegrees:(CGFloat)degrees
                                      withAnchorPoit:(CGPoint)anchorPoint
                                     withPerspective:(BOOL)isPerspective;

/**
 Path形变动画，演示如何配合maskLayer转换贝塞尔曲线
 */
+ (CABasicAnimation *)shapePathAnimationWithFromPath:(UIBezierPath *)fromPath
                                              toPath:(UIBezierPath *)toPath
                                             reverse:(BOOL)isReverse;

@end
