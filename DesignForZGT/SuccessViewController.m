//
//  SuccessViewController.m
//  DesignForZGT
//
//  Created by liuxiaodan on 14-5-11.
//  Copyright (c) 2014年 liuxiaodan. All rights reserved.
//

#import "SuccessViewController.h"
#import "FirstViewController.h"

@interface SuccessViewController ()

@end

@implementation SuccessViewController

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
    [self.backButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    
    [self.submitButton setImage:[UIImage imageNamed:@"suc"] forState:UIControlStateNormal];
    [self.submitButton setImage:[UIImage imageNamed:@"sucHigh"] forState:UIControlStateHighlighted];
    [self.submitButton addTarget:self action:@selector(submitAction) forControlEvents:UIControlEventTouchUpInside];
    UITapGestureRecognizer *tap =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(submitAction)];
    [self.view addGestureRecognizer:tap];
}
-(void)submitAction
{
    FirstViewController *fvc = [[FirstViewController alloc]initWithNibName:@"FirstViewController" bundle:nil];
    [self.navigationController pushViewController:fvc animated:YES];
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
