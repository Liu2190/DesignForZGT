//
//  KindsViewController.m
//  DesignForZGT
//
//  Created by liuxiaodan on 14-5-11.
//  Copyright (c) 2014年 liuxiaodan. All rights reserved.
//

#import "KindsViewController.h"

@interface KindsViewController ()
@end

@implementation KindsViewController

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
    NSArray *array = [NSArray arrayWithObjects:@"Background1",@"Background2",@"Background3",@"Background4",@"Background5",@"Background6",@"Background7", nil];
    UIImageView *iam = [[UIImageView alloc]initWithImage:[UIImage imageNamed:[array objectAtIndex:self.num]]];
    iam.frame = CGRectMake(0, 0, 320, 568);
    [self.view addSubview:iam];
    [self.view bringSubviewToFront:self.backButton];
    [self.backButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
}
-(void)backAction
{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
