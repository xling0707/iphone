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


@implementation LINGMoreViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
	}
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if([segue.identifier isEqualToString:@"loginout"]){
        [LINGLoginManager sharedManager].password = nil;
        [[LINGLoginManager sharedManager] save:nil];
        [[LINGAPIClient sharedClient].requestSerializer setAuthorizationHeaderFieldWithToken:nil];
    }
}


@end
