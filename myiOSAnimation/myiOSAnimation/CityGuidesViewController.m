//
//  CityGuidesViewController.m
//  myiOSAnimation
//
//  Created by 彭益伟 on 7/21/16.
//  Copyright © 2016 pengyiwei. All rights reserved.
//

#import "CityGuidesViewController.h"
#import "CityTableViewCell.h"

static NSString * const kCityCell = @"kFirstCell";

@interface CityGuidesViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *cityTableView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tableViewTopConstraint;

@end

@implementation CityGuidesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [_cityTableView registerClass:[CityTableViewCell class] forCellReuseIdentifier:kCityCell];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    _cityTableView.transform = CGAffineTransformMakeTranslation(0, [UIScreen mainScreen].bounds.size.height);
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [UIView animateWithDuration:1 animations:^{
        self.cityTableView.transform = CGAffineTransformIdentity;
    }];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    cell.contentView.backgroundColor = [UIColor redColor];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CityTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCityCell];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 120;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    static CGFloat originY = 64;
    
    CGRect cellrect = [_cityTableView rectForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    CGRect convertRect = [_cityTableView convertRect:cellrect toView:_cityTableView.superview];
    
    CGFloat offsetY = originY - convertRect.origin.y;
    
//    CGFloat offsetY = 0;
//    if (convertRect.origin.y >= 0) {
//        
//    } else {
//        
//    }
    
    CityTableViewCell *cell = [_cityTableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    [cell startMoveWithoffsetY:offsetY];
    NSLog(@"cell frame is %@", NSStringFromCGRect(convertRect));
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
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
