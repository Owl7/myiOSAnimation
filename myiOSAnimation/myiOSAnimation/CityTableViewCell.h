//
//  CityTableViewCell.h
//  myiOSAnimation
//
//  Created by 彭益伟 on 7/20/16.
//  Copyright © 2016 pengyiwei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CityTableViewCell : UITableViewCell

@property (strong, nonatomic) UIView *leftView;
@property (strong, nonatomic) UILabel *leftLabel;
@property (strong, nonatomic) UIView *rightView;
@property (strong, nonatomic) UILabel *rightLabel;

- (void)startMoveWithoffsetY:(CGFloat)offsetY;

@end
