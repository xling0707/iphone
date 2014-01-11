//
//  LINGLoginViewController.m
//  iphone
//
//  Created by 李晓肆 on 14-1-11.
//  Copyright (c) 2014年 xianlvke. All rights reserved.
//

#import "LINGLoginViewController.h"
#import "LINGRegisterViewController.h"

@interface LINGLoginViewController ()

/*!
 *  用户名
 */
@property (strong, nonatomic) UITextField *usernameField;
/*!
 *  密码
 */
@property (strong, nonatomic) UITextField *passwordField;
/*!
 *  登录
 */
@property (strong, nonatomic) UIButton *loginButton;

- (void) switchRegister:(id) sender;
- (void) login : (id)sender;

@end

@implementation LINGLoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        NSString *title = NSLocalizedString(@"login-nav-title", @"登录-标题");
        self.title = title;
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"login-nav-register", @"登录-注册") style:UIBarButtonItemStylePlain target:self action:@selector(switchRegister:)];
    }
    return self;
}


- (void) switchRegister:(id) sender
{
    DDLogVerbose(@"%@",@"切换至注册");
    LINGRegisterViewController *registerController = [[LINGRegisterViewController alloc] initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:registerController animated:YES];
}

- (void)login:(id)sender
{
    DDLogVerbose(@"%@",@"登录");
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    UILabel *usernameLabel = [[UILabel alloc] init];
    UILabel *passwordLabel = [[UILabel alloc] init];
    self.usernameField = [[UITextField alloc] init];
    self.passwordField = [[UITextField alloc] init];
    self.loginButton = [[UIButton alloc] init];
    
    usernameLabel.text = NSLocalizedString(@"login-label-username", @"用户名");
    passwordLabel.text = NSLocalizedString(@"login-label-password", @"密码");
    
    
    self.usernameField.placeholder = NSLocalizedString(@"login-field-username-placehold", @"帐号占位提示");
    self.passwordField.secureTextEntry = YES;
    self.passwordField.placeholder = NSLocalizedString(@"login-filed-password-tip", @"密码占位提示");
    
    
    // 注册事件
    [self.loginButton addTarget:self action:@selector(login:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:usernameLabel];
    [self.view addSubview:passwordLabel];
    [self.view addSubview:self.usernameField];
    [self.view addSubview:self.passwordField];
    
    NSDictionary *viewsBindings = NSDictionaryOfVariableBindings(usernameLabel,passwordLabel,_usernameField,_passwordField,_loginButton);
    
    for (NSString *key in viewsBindings) {
        UIView *v =  (UIView *)viewsBindings[key];
 		[v setTranslatesAutoresizingMaskIntoConstraints:NO];
    }
    
    NSDictionary *metrics = @{
          @"paddingTop" 	: @80,
          @"labelWidth" 	: @80,
          @"labelHeight" 	: @37,
          @"fieldWidth" 	: @120,
          @"fieldHeight" 	: @37
    };
    
    
    NSArray *visualFormatStrings = @[
        @"H:[usernameLabel(==labelWidth)]",
        @"V:[usernameLabel(==labelHeight)]",
        
        @"H:[passwordLabel(==usernameLabel)]",
        @"V:[passwordLabel(==usernameLabel)]",
        
        @"H:[_usernameField(>=fieldWidth)]",
        @"V:[_usernameField(==fieldHeight)]",
        
        @"H:[_passwordField(==_usernameField)]",
        @"V:[_passwordField(==_usernameField)]",
        
        @"H:|-[usernameLabel]-(10)-[_usernameField]-|",
        @"H:|-[passwordLabel]-(10)-[_passwordField]-|",
        
        @"V:|-(paddingTop)-[usernameLabel]-(20)-[passwordLabel]",
        @"V:|-(paddingTop)-[_usernameField]-(20)-[_passwordField]"
	];
    
    NSMutableArray *constraintsArray = [NSMutableArray array];

    for (NSString *vs in visualFormatStrings) {
        [constraintsArray addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:vs options:0 metrics:metrics views:viewsBindings]];
    }
    
    [self.view addConstraints:constraintsArray];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
