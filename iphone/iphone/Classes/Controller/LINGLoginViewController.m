//
//  LINGLoginViewController.m
//  iphone
//
//  Created by 李晓肆 on 14-1-11.
//  Copyright (c) 2014年 xianlvke. All rights reserved.
//

#import "LINGLoginViewController.h"
#import "LINGRegisterViewController.h"
#import "LINGAPIClient.h"
#import "LINGLoginManager.h"
#import "LINGAppDelegate.h"

@interface LINGLoginViewController ()
@property (strong, nonatomic) IBOutlet UITextField *usernameField;
@property (strong, nonatomic) IBOutlet UITextField *passwordField;
@property (strong, nonatomic) IBOutlet UIButton *loginButton;
- (IBAction)login:(id)sender;
@end

@implementation LINGLoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (IBAction)login:(id)sender {
    DDLogVerbose(@"%@",@"登录");
    if (self.usernameField.text.length && self.passwordField.text.length) {
        
        [[LINGAPIClient sharedClient] loginWithName:self.usernameField.text withPassword:self.passwordField.text withBlock:^(LINGRespondeModel *response, NSError *error) {
            if(response.ok)
            {
                NSString *token = response.data[@"token"];
                [LINGLoginManager sharedManager].password = token;
                [[LINGLoginManager sharedManager] save:nil];
                [[LINGAPIClient sharedClient].requestSerializer setAuthorizationHeaderFieldWithToken:token];
                [self performSegueWithIdentifier:@"toHome" sender:self];
            }
            else{
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"警告" message:response.msg delegate:nil cancelButtonTitle: @"取消" otherButtonTitles: nil];
                [alert show];
            }
            DDLogVerbose(@"callback%@",response);
            DDLogVerbose(@"err %d",response.err);
            DDLogVerbose(@"msg %@",response.msg);
        }];
        
    }
    else{
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle: @"警告" message:@"没有帐号，密码" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles: nil];
        [alert show];
    }
}



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
