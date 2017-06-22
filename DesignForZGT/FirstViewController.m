//
//  FirstViewController.m
//  DesignForZGT
//
//  Created by liuxiaodan on 14-5-17.
//  Copyright (c) 2014年 liuxiaodan. All rights reserved.
//

#import "FirstViewController.h"
#import "RootViewController.h"
#import "FogetViewController.h"
#import "RegisterViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
    // Do any additional setup after loading the view from its nib.
    [self.fogetButton setImage:[UIImage imageNamed:@"firstClick"] forState:UIControlStateNormal];
    [self.fogetButton setImage:[UIImage imageNamed:@"fisrtClickHigh"] forState:UIControlStateHighlighted];
    [self.registerButton setImage:[UIImage imageNamed:@"firstRegister"] forState:UIControlStateNormal];
    [self.registerButton setImage:[UIImage imageNamed:@"frstRegisterHigh"] forState:UIControlStateHighlighted];
    [self.joinButton setImage:[UIImage imageNamed:@"firstEnter"] forState:UIControlStateNormal];
    [self.joinButton setImage:[UIImage imageNamed:@"firstEnterHIgh"] forState:UIControlStateHighlighted];
    self.passwordTf.secureTextEntry = YES;
    [self.fogetButton addTarget:self action:@selector(forgetAction) forControlEvents:UIControlEventTouchUpInside];
    [self.registerButton addTarget:self action:@selector(registerAction) forControlEvents:UIControlEventTouchUpInside];
    [self.joinButton addTarget:self action:@selector(joinAction) forControlEvents:UIControlEventTouchUpInside];
}
-(void)forgetAction
{
    FogetViewController *fvc = [[FogetViewController alloc]initWithNibName:@"FogetViewController" bundle:nil];
    [self.navigationController pushViewController:fvc animated:YES];
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}
-(void)registerAction
{
    RegisterViewController *fvc = [[RegisterViewController alloc]initWithNibName:@"RegisterViewController" bundle:nil];
    [self.navigationController pushViewController:fvc animated:YES];
}
-(void)joinAction
{
    RootViewController *fvc = [[RootViewController  alloc]initWithNibName:@"RootViewController" bundle:nil];
    [self.navigationController pushViewController:fvc animated:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
