//
//  HomeTableViewController.m
//  myiOSAnimation
//
//  Created by 彭益伟 on 7/14/16.
//  Copyright © 2016 pengyiwei. All rights reserved.
//

#import "HomeTableViewController.h"

static NSString * const kShowShadow = @"kShowShadow";
static NSString * const kShowTransform = @"kShowTransform";
static NSString * const kShowMask = @"kShowMask";
static NSString * const kShowCellAnimation = @"kShowCellAnimation";
static NSString * const kShowGroup = @"kShowGroup";
static NSString * const kShowFillModeVC = @"kShowFillModeVC";
static NSString * const kShowPath = @"kShowPath";
static NSString * const kPushToCity = @"kPushToCity";

@interface HomeTableViewController ()
{
    NSArray *cellTitleArray;
    NSArray *segueArray;
}

@end

@implementation HomeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"动画";
    
    cellTitleArray = @[@"阴影动画", @"旋转动画", @"遮罩动画", @"Cell加载动画", @"路径动画", @"组动画", @"填充模式讲解", @"City Guides"];
    segueArray = @[kShowShadow, kShowTransform, kShowMask, kShowCellAnimation, kShowPath, kShowGroup, kShowFillModeVC, kPushToCity];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return cellTitleArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"kBasicCell"];
    
    cell.textLabel.text = cellTitleArray[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:segueArray[indexPath.row] sender:nil];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
