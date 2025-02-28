#import "SettingsViewController.h"

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"设置";
    
    // 定义按钮
    UIButton *logoutButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [logoutButton setTitle:@"登出" forState:UIControlStateNormal];
    logoutButton.frame = CGRectMake(100, 100, 100, 50);
    [logoutButton addTarget:self action:@selector(logout) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:logoutButton];
    
    UIButton *deleteAccountButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [deleteAccountButton setTitle:@"注销账户" forState:UIControlStateNormal];
    deleteAccountButton.frame = CGRectMake(100, 200, 100, 50);
    [deleteAccountButton addTarget:self action:@selector(deleteAccount) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:deleteAccountButton];
}

- (void)logout {
    // 实现登出功能
}

- (void)deleteAccount {
    // 实现注销账户功能
}

@end 
