//
//  PGCardTableViewCell.m
//  myiOSAnimation
//
//  Created by 彭益伟 on 7/20/16.
//  Copyright © 2016 pengyiwei. All rights reserved.
//

#import "PGCardTableViewCell.h"

@implementation PGCardTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
    
}

- (void)startAnimationWithDelay:(CGFloat)delayTime {
    CGFloat screenWith = [UIScreen mainScreen].bounds.size.width;
    _cardView.transform = CGAffineTransformMakeTranslation(screenWith, 0);
    [UIView animateWithDuration:1. delay:delayTime usingSpringWithDamping:0.6 initialSpringVelocity:0 options:0 animations:^{
        _cardView.transform = CGAffineTransformIdentity;
    } completion:NULL];
}

@end
