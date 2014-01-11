//
//  LINGLoginViewController.m
//  iphone
//
//  Created by 李晓肆 on 14-1-11.
//  Copyright (c) 2014年 xianlvke. All rights reserved.
//

#import "LINGLoginViewController.h"

@interface LINGLoginViewController ()
- (void) setupNavgationItem;
- (void) switchRegister:(id) sender;
@end

@implementation LINGLoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [self setupNavgationItem];
    }
    return self;
}

- (void)setupNavgationItem
{
    
    NSString *title = NSLocalizedString(@"login-nav-title", @"登录-标题");
    
    self.title = title;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"login-nav-register", @"登录-注册") style:UIBarButtonItemStylePlain target:self action:@selector(switchRegister:)];
    
}

- (void) switchRegister:(id) sender
{
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    UILabel *usernameLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    UILabel *passwordLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.usernameField = [[UITextField alloc] initWithFrame:CGRectZero];
    self.passwordField = [[UITextField alloc] initWithFrame:CGRectZero];
    self.loginButton = [[UIButton alloc] initWithFrame:CGRectZero];
    
    
    
    
    
    [self.view addSubview:usernameLabel];
    [self.view addSubview:passwordLabel];
    [self.view addSubview:self.usernameField];
    [self.view addSubview:self.passwordField];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
