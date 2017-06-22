//
//  RegisterViewController.m
//  DesignForZGT
//
//  Created by liuxiaodan on 14-5-17.
//  Copyright (c) 2014年 liuxiaodan. All rights reserved.
//

#import "RegisterViewController.h"
#import "RegisterSucViewController.h"
@interface RegisterViewController ()

@end

@implementation RegisterViewController

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
    [self.enterButton setImage:[UIImage imageNamed:@"registerSureButton"] forState:UIControlStateNormal];
    [self.enterButton setImage:[UIImage imageNamed:@"registerSereHigh"] forState:UIControlStateHighlighted];
    [self.enterButton addTarget:self action:@selector(enterAction) forControlEvents:UIControlEventTouchUpInside];
    [self.backButton setImage:[UIImage imageNamed:@"registerBackButton"] forState:UIControlStateNormal];
    [self.backButton setImage:[UIImage imageNamed:@"registerBackButHigh"] forState:UIControlStateHighlighted];
    [self.backButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
}
-(void)enterAction
{
    RegisterSucViewController *rvc = [[RegisterSucViewController alloc]initWithNibName:@"RegisterSucViewController" bundle:nil];
    [self.navigationController pushViewController:rvc animated:YES];
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
