//
//  PGCardTableViewCell.h
//  myiOSAnimation
//
//  Created by 彭益伟 on 7/20/16.
//  Copyright © 2016 pengyiwei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PGCardTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *cardView;
- (void)startAnimationWithDelay:(CGFloat)delayTime;

@end
