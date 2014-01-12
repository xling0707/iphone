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
        self.navigationItem.title = title;
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
    if (self.usernameField.text.length && self.passwordField.text.length) {
        
        [[LINGAPIClient sharedClient] loginWithName:self.usernameField.text withPassword:self.passwordField.text withBlock:^(LINGRespondeModel *response, NSError *error) {
            if(response.ok)
            {
            }
            else{
                NSString *alertTitle = NSLocalizedString(@"login-alert-title", @"警告");
                NSString *alertCancel = NSLocalizedString(@"login-alert-cancel", @"取消");
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:alertTitle message:response.msg delegate:nil cancelButtonTitle:alertCancel otherButtonTitles: nil];
                [alert show];
            }
            DDLogVerbose(@"callback%@",response);
            DDLogVerbose(@"err %d",response.err);
            DDLogVerbose(@"msg %@",response.msg);
        }];
        
    }
    else{
        NSString *alertTitle = NSLocalizedString(@"login-alert-title", @"警告");
        NSString *alertMsg = NSLocalizedString(@"login-alert-msg", @"没有帐号，密码");
        NSString *alertCancel = NSLocalizedString(@"login-alert-cancel", @"取消");
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:alertTitle message:alertMsg delegate:nil cancelButtonTitle:alertCancel otherButtonTitles: nil];
        [alert show];
    }
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
    
    usernameLabel.text = NSLocalizedString(@"login-label-username", @"帐号");
    passwordLabel.text = NSLocalizedString(@"login-label-password", @"密码");
    
    
    self.usernameField.placeholder = NSLocalizedString(@"login-field-username-placehold", @"帐号占位提示");
    self.passwordField.secureTextEntry = YES;
    self.passwordField.placeholder = NSLocalizedString(@"login-filed-password-tip", @"密码占位提示");
    
    [self.loginButton setTitle:NSLocalizedString(@"login-button-login", @"登录") forState:UIControlStateNormal];
    [self.loginButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    
    
    // 注册事件
    [self.loginButton addTarget:self action:@selector(login:) forControlEvents:UIControlEventTouchUpInside];
    
    
    NSDictionary *viewsBindings = NSDictionaryOfVariableBindings(usernameLabel,passwordLabel,_usernameField,_passwordField,_loginButton);
    
    for (NSString *key in viewsBindings) {
        UIView *v =  (UIView *)viewsBindings[key];
 		[v setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.view addSubview:v];
    }
    
    
    
    NSDictionary *metrics = @{
          @"paddingTop" 	: @80,
          @"labelWidth" 	: @55,
          @"labelHeight" 	: @37,
          @"fieldWidth" 	: @120,
          @"fieldHeight" 	: @37,
          @"buttonWidth"	: @100,
          @"buttonHeight"	: @50
    };
    
    
    NSArray *visualFormatStrings = @[
        @"H:[usernameLabel(==labelWidth)]",
        @"V:[usernameLabel(==labelHeight)]",
        
        @"H:[passwordLabel(==usernameLabel)]",
        @"V:[passwordLabel(==usernameLabel)]",
        
        @"H:[_usernameField(>=fieldWidth)]",
        @"V:[_usernameField(==fieldHeight)]",
        
        
        @"H:|-[_loginButton(>=buttonWidth)]-|",
        @"V:[_loginButton(==buttonHeight)]",
        
        @"H:[_passwordField(==_usernameField)]",
        @"V:[_passwordField(==_usernameField)]",
        
        
        @"H:|-[usernameLabel]-(2)-[_usernameField]-|",
        @"H:|-[passwordLabel]-(2)-[_passwordField]-|",
        
        @"V:|-(paddingTop)-[usernameLabel]-(10)-[passwordLabel]-(10)-[_loginButton]",
        @"V:|-(paddingTop)-[_usernameField]-(10)-[_passwordField]-(10)-[_loginButton]"
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
