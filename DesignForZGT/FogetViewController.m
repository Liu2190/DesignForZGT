//
//  FogetViewController.m
//  DesignForZGT
//
//  Created by liuxiaodan on 14-5-17.
//  Copyright (c) 2014年 liuxiaodan. All rights reserved.
//

#import "FogetViewController.h"
#import "MimaSuccessViewController.h"
@interface FogetViewController ()

@end

@implementation FogetViewController

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
    [self.backButton setImage:[UIImage imageNamed:@"forgetBackButton"] forState:UIControlStateNormal];
    [self.backButton setImage:[UIImage imageNamed:@"forgetBackButtonHigh"] forState:UIControlStateHighlighted];
    [self.backButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    [self.enterButton setImage:[UIImage imageNamed:@"forgetButton"] forState:UIControlStateNormal];
    [self.enterButton setImage:[UIImage imageNamed:@"forgetButtonHigh"] forState:UIControlStateHighlighted];
    [self.enterButton addTarget:self action:@selector(enterAction) forControlEvents:UIControlEventTouchUpInside];
}
-(void)backAction
{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)enterAction
{
    MimaSuccessViewController *mVC = [[MimaSuccessViewController alloc]initWithNibName:@"MimaSuccessViewController" bundle:nil];
    [self.navigationController pushViewController:mVC animated:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
