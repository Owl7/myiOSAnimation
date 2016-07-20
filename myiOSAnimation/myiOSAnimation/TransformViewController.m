//
//  TransformViewController.m
//  myiOSAnimation
//
//  Created by 彭益伟 on 7/20/16.
//  Copyright © 2016 pengyiwei. All rights reserved.
//

#import "TransformViewController.h"
#import "CABasicAnimationDemo.h"

@interface TransformViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;

@end

@implementation TransformViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)startTransformXAxisAnimation:(id)sender {
    [_avatarImageView.layer removeAllAnimations];
    [_avatarImageView.layer addAnimation:[CABasicAnimationDemo transformAxisAnimationforLayer:_avatarImageView.layer withAxis:kXAxisTransform withDegrees:90 withAnchorPoit:CGPointMake(0.5, 0.5) withPerspective:YES] forKey:@"transformX"];
}

- (IBAction)startTransformYAxisAnimation:(id)sender {
    [_avatarImageView.layer removeAllAnimations];
    [_avatarImageView.layer addAnimation:[CABasicAnimationDemo transformAxisAnimationforLayer:_avatarImageView.layer withAxis:kYAxisTransform withDegrees:90 withAnchorPoit:CGPointMake(0.5, 0.5) withPerspective:YES] forKey:@"transformY"];
}

- (IBAction)startTransformZAxisAnimation:(id)sender {
    [_avatarImageView.layer removeAllAnimations];
    [_avatarImageView.layer addAnimation:[CABasicAnimationDemo transformAxisAnimationforLayer:_avatarImageView.layer withAxis:kZAxisTransform withDegrees:90 withAnchorPoit:CGPointMake(0.5, 0.5) withPerspective:YES] forKey:@"transformZ"];
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
