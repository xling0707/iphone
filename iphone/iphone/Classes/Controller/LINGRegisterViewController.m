//
//  LINGRegisterViewController.m
//  iphone
//
//  Created by 李晓肆 on 14-1-11.
//  Copyright (c) 2014年 xianlvke. All rights reserved.
//

#import "LINGRegisterViewController.h"

@interface LINGRegisterViewController ()

@property (nonatomic, strong) UITextField *usernameField;
@property (nonatomic, strong) UITextField *emailField;
@property (nonatomic, strong) UITextField *passwordField;
@property (nonatomic, strong) UIButton *registerButton;


- (void) registerDone : (id)sender;
@end

@implementation LINGRegisterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = NSLocalizedString(@"register-nav-title", @"注册-标题");
        NSString *rightBarTitle = NSLocalizedString(@"register-nav-continue", @"注册-继续");
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:rightBarTitle style:UIBarButtonItemStylePlain target:self action:@selector(registerDone:)];
        
    }
    return self;
}

- (void)registerDone:(id)sender
{
    DDLogVerbose(@"%@",@"继续");
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
