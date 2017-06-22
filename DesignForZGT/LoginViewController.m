//
//  LoginViewController.m
//  DesignForZGT
//
//  Created by liuxiaodan on 14-5-11.
//  Copyright (c) 2014年 liuxiaodan. All rights reserved.
//

#import "LoginViewController.h"
#import "SuccessViewController.h"
@interface LoginViewController ()

@end

@implementation LoginViewController

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
    // Do any additional setup after loading the view from its nib.
    [self.backButton setImage:[UIImage imageNamed:@"photoback"] forState:UIControlStateNormal];
    [self.backButton setImage:[UIImage imageNamed:@"photobackhigh"] forState:UIControlStateHighlighted];
    [self.submitButton setImage:[UIImage imageNamed:@"commit"] forState:UIControlStateNormal];
    [self.submitButton setImage:[UIImage imageNamed:@"commitHigh"] forState:UIControlStateHighlighted];
    [self.backButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    [self.submitButton addTarget:self action:@selector(submitAction) forControlEvents:UIControlEventTouchUpInside];
}
-(void)submitAction
{
    [self.view endEditing:YES];
    SuccessViewController *svc = [[SuccessViewController alloc]initWithNibName:@"SuccessViewController" bundle:nil];
    [self.navigationController pushViewController:svc animated:YES];
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

-(void)backAction
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
