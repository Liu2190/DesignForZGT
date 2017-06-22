//
//  MimaSuccessViewController.m
//  DesignForZGT
//
//  Created by liuxiaodan on 14-5-17.
//  Copyright (c) 2014年 liuxiaodan. All rights reserved.
//

#import "MimaSuccessViewController.h"
#import "RootViewController.h"
@interface MimaSuccessViewController ()

@end

@implementation MimaSuccessViewController

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
    [self.enterButton setImage:[UIImage imageNamed:@"successLogin"] forState:UIControlStateNormal];
    [self.enterButton setImage:[UIImage imageNamed:@"successLoginHigh"] forState:UIControlStateHighlighted];
    [self.enterButton addTarget:self action:@selector(enterAction) forControlEvents:UIControlEventTouchUpInside];
}
-(void)enterAction
{
    RootViewController *rvc = [[RootViewController alloc]initWithNibName:@"RootViewController" bundle:nil];
    [self.navigationController pushViewController:rvc animated:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
