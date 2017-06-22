//
//  SettingViewController.m
//  DesignForZGT
//
//  Created by liuxiaodan on 14-5-11.
//  Copyright (c) 2014年 liuxiaodan. All rights reserved.
//

#import "SettingViewController.h"
#import "KindsViewController.h"
@interface SettingViewController ()

@end

@implementation SettingViewController

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
    self.navigationController.navigationBarHidden = YES;
    [self.backButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    [self.backButton setImage:[UIImage imageNamed:@"settingBackButton"] forState:UIControlStateNormal];
    [self.backButton setImage:[UIImage imageNamed:@"settingBackButtonHigh"] forState:UIControlStateHighlighted];
    [self setselfValue];
}
-(void)setselfValue
{
    NSArray *normal = [NSArray arrayWithObjects:@"setting1n",@"setting2n",@"setting3n",@"setting4n",@"setting5n",@"setting6n",@"setting7n", nil];
    NSArray *high = [NSArray arrayWithObjects:@"setting1",@"setting2",@"setting3",@"setting4",@"setting5",@"setting6",@"setting7", nil];
    for(int i = 0;i<[normal count];i++)
    {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(30 +(i%3)*98, (i/3)*94+87, 72, 72);
        [self.view addSubview:button];
        button.tag = i+10;
        [button addTarget:self action:@selector(selectAction:) forControlEvents:UIControlEventTouchUpInside];
        [button setImage:[UIImage imageNamed:[normal objectAtIndex:i]] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:[high objectAtIndex:i]] forState:UIControlStateSelected];
    }

}
-(void)selectAction:(UIButton *)button
{
    
    KindsViewController *k = [[KindsViewController alloc]initWithNibName:@"KindsViewController" bundle:nil];
    k.num = (int)button.tag - 10;
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:k];
    [self.navigationController presentViewController:nav animated:YES completion:nil];
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
