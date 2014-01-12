//
//  LINGMoreViewController.m
//  iphone
//
//  Created by 李晓肆 on 14-1-12.
//  Copyright (c) 2014年 xianlvke. All rights reserved.
//

#import "LINGMoreViewController.h"
#import "LINGLoginManager.h"
#import "LINGAPIClient.h"
#import "LINGAppDelegate.h"

static NSString * const CellReuseIdentifierForLoginOut = @"login-out-identifier";

@interface LINGMoreViewController ()
- (void) loginOut :(id)sender;
@end

@implementation LINGMoreViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
	}
    return self;
}

- (void) loginOut:(id)sender
{
    [LINGLoginManager sharedManager].password = nil;
    [[LINGLoginManager sharedManager] save:nil];
    [[LINGAPIClient sharedClient].requestSerializer setAuthorizationHeaderFieldWithToken:nil];
    LINGAppDelegate *delegate = [UIApplication sharedApplication].delegate;
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:delegate.loginViewController];
    self.view.window.rootViewController = nav;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.navigationItem.title = NSLocalizedString(@"more-nav-title", @"更多-标题");
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CellReuseIdentifierForLoginOut];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell  = nil;
    // Configure the cell...
    if (0 == indexPath.row) {
        cell = [tableView dequeueReusableCellWithIdentifier:CellReuseIdentifierForLoginOut forIndexPath:indexPath];
        cell.textLabel.text = NSLocalizedString(@"more-login-out", @"退出");
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (0 == indexPath.row) {
        [self loginOut:nil];
    }
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
