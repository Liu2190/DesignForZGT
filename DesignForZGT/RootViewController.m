//
//  RootViewController.m
//  DesignForZGT
//
//  Created by liuxiaodan on 14-5-11.
//  Copyright (c) 2014年 liuxiaodan. All rights reserved.
//

#import "RootViewController.h"
#import "PageOneView.h"
#import "SettingViewController.h"
#import "PhotoViewController.h"
@interface RootViewController ()
@property (nonatomic,weak)PageOneView *backView;
@end

@implementation RootViewController

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
    self.view.backgroundColor = [UIColor colorWithRed:41.0/255.0 green:127.0/255.0 blue:250.0/255.0 alpha:1];
    self.navigationController.navigationBarHidden = YES;
    UIScrollView *scro = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 320, 568)];
    scro.contentSize = CGSizeMake(320, 760);
    scro.userInteractionEnabled = YES;
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.view addSubview:scro];
    scro.backgroundColor = [UIColor clearColor];
    self.backView = [[[NSBundle mainBundle]loadNibNamed:@"PageOneView" owner:self options:nil]lastObject];
    [scro addSubview:self.backView];
    self.backView.frame = CGRectMake(0, 0, 320, 760);
    [self.backView.settingButtton setImage:[UIImage imageNamed:@"pageOneNormal"] forState:UIControlStateNormal];
    [self.backView.settingButtton setImage:[UIImage imageNamed:@"pageOneHigh"] forState:UIControlStateHighlighted];
    [self.backView.settingButtton addTarget:self action:@selector(settingViewAction) forControlEvents:UIControlEventTouchUpInside];
    [self.backView.nextButton setImage:[UIImage imageNamed:@"pageOneNext"] forState:UIControlStateNormal];
    [self.backView.nextButton setImage:[UIImage imageNamed:@"pageOneNextHigh"] forState:UIControlStateHighlighted];
    [self.backView.nextButton addTarget:self action:@selector(nextViewAction) forControlEvents:UIControlEventTouchUpInside];
    [self setScrolValue];
}
-(void)settingViewAction
{
    SettingViewController *view1 = [[SettingViewController alloc]initWithNibName:@"SettingViewController" bundle:nil];
//    UIView * view = self.navigationController.view;
//    CATransition *  tran=[CATransition animation];
//    tran.type = kCATransitionReveal;
//    tran.subtype = kCATransitionFromLeft;
//    [self.view.layer addAnimation:tran forKey:@"kongyu"];
    UINavigationController *nv = [[UINavigationController alloc]initWithRootViewController:view1];
    [self.navigationController presentViewController:nv animated:YES completion:nil];
//    tran.duration=0.2;
//    tran.delegate=self;
//    [view.layer addAnimation:tran forKey:@"ads"];
}
-(void)nextViewAction
{
    int i = 10;
    int c =0;
    for(i =10;i<21;i++)
    {
        UIButton *b = (UIButton *)[self.view viewWithTag:i];
        if([b isKindOfClass:[UIButton class]])
        {
            if(b.selected == YES)
            {
                c =  1;
                break;
            }
        }
    }
    if(c==0)
    {
        UIAlertView *al = [[UIAlertView alloc]initWithTitle:@"请选择您喜欢的杯具样式" message:nil delegate:nil cancelButtonTitle:@"好的" otherButtonTitles:nil, nil];
        [al show];
        return;
    }
    PhotoViewController *view = [[PhotoViewController alloc]initWithNibName:@"PhotoViewController" bundle:nil];
    view.cupType = i-10;
    [self.navigationController pushViewController:view animated:YES];
}
-(void)setScrolValue
{
    NSArray *normal = [NSArray arrayWithObjects:@"oneButton1",@"oneButton2",@"oneButton3",@"oneButton4",@"oneButton5",@"oneButton6",@"oneButton7",@"oneButton8",@"oneButton9",@"oneButton10",@"oneButton11", nil];
    NSArray *highlighted = [NSArray arrayWithObjects:@"oneButton1High",@"oneButton2high",@"oneButton3high",@"oneButton4high",@"oneButton5high",@"oneButton6high",@"oneButton7high",@"oneButton8high",@"oneButton9high",@"oneButton10high",@"oneButton11high", nil];
    for(int i = 0;i<[normal count];i++)
    {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(23 +(i%3)*95, (i/3)*100+210, 86, 86);
        [self.backView addSubview:button];
        button.tag = i+10;
        
        [button addTarget:self action:@selector(selectAction:) forControlEvents:UIControlEventTouchUpInside];
        [button setImage:[UIImage imageNamed:[normal objectAtIndex:i]] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:[highlighted objectAtIndex:i]] forState:UIControlStateSelected];
    }
}
-(void)selectAction:(UIButton *)button
{
    button.selected = !button.selected;
    for(int i = 10;i<21;i++)
    {
        if(i!=button.tag){
            UIButton *b = (UIButton *)[self.backView viewWithTag:i];
            if([b isKindOfClass:[UIButton class]])
            {
                b.selected = NO;
            }
        }
    }
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
