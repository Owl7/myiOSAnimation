//
//  PathAnimationViewController.m
//  myiOSAnimation
//
//  Created by 彭益伟 on 7/18/16.
//  Copyright © 2016 pengyiwei. All rights reserved.
//

#import "PathAnimationViewController.h"
#import "CABasicAnimationDemo.h"

@interface PathAnimationViewController ()
{
    UIBezierPath *smallOvalPath;
    UIBezierPath *ovalPath;
    
    CAShapeLayer *maskLayer;
    
    UIButton *recordButton;
    
    BOOL isReverse;
}

@end

@implementation PathAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect rect2 = CGRectMake(0, 0, 200, 200);
    smallOvalPath = [UIBezierPath bezierPathWithRoundedRect:rect2 cornerRadius:0];
    ovalPath = [UIBezierPath bezierPathWithRoundedRect:rect2 cornerRadius:100];
    
    maskLayer = [CAShapeLayer layer];
    maskLayer.path = smallOvalPath.CGPath;
    
    recordButton = [UIButton buttonWithType:UIButtonTypeCustom];
    recordButton.backgroundColor = [UIColor redColor];
    recordButton.frame = CGRectMake(100, 100, 200, 200);
    recordButton.layer.mask = maskLayer;
    [self.view addSubview:recordButton];
    
}

- (IBAction)startPathAnimation:(id)sender {
    [recordButton.layer removeAllAnimations];
    [maskLayer addAnimation:[CABasicAnimationDemo shapePathAnimationWithFromPath:smallOvalPath toPath:ovalPath reverse:!isReverse] forKey:@"pathAnimation"];
    isReverse = !isReverse;
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
