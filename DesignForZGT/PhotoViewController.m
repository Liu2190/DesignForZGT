//
//  PhotoViewController.m
//  DesignForZGT
//
//  Created by liuxiaodan on 14-5-11.
//  Copyright (c) 2014年 liuxiaodan. All rights reserved.
//

#import "PhotoViewController.h"
#import "ImagePickerViewController.h"
#import "Mp4ViewController.h"
#import "LoginViewController.h"
#import "SharePlatformView.h"

@interface PhotoViewController ()<ImagePickerViewControllerDelegate>
@property (nonatomic,assign)int photoType;
@end

@implementation PhotoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.photoType = 0;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.rightButton.hidden = YES;
    
    self.allButtonView.hidden = YES;
    self.heatButton.hidden = YES;
    [self.rightButton setImage:[UIImage imageNamed:@"settingBackButton"] forState:UIControlStateNormal];
    [self.rightButton setImage:[UIImage imageNamed:@"settingBackButtonHigh"] forState:UIControlStateHighlighted];
    [self.rightButton addTarget:self action:@selector(rightAction) forControlEvents:UIControlEventTouchUpInside];
    
    [self.leftButton setImage:[UIImage imageNamed:@"photoback"] forState:UIControlStateNormal];
    [self.leftButton setImage:[UIImage imageNamed:@"photobackhigh"] forState:UIControlStateHighlighted];
    [self.leftButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    
    [self.addImageButton setImage:[UIImage imageNamed:@"photocenterButton"] forState:UIControlStateNormal];
    [self.addImageButton setImage:[UIImage imageNamed:@"photocenterButtonHigh"] forState:UIControlStateHighlighted];
    [self.addImageButton addTarget:self action:@selector(addImageAction) forControlEvents:UIControlEventTouchUpInside];
    
    [self.cupButton setImage:[UIImage imageNamed:@"cupButton"] forState:UIControlStateNormal];
    [self.cupButton setImage:[UIImage imageNamed:@"cupButtonHigh"] forState:UIControlStateHighlighted];
    [self.cupButton addTarget:self action:@selector(cupButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
    [self.heatButton setImage:[UIImage imageNamed:@"huoButton"] forState:UIControlStateNormal];
    [self.heatButton setImage:[UIImage imageNamed:@"huoButtonHigh"] forState:UIControlStateHighlighted];
    [self.heatButton addTarget:self action:@selector(heatButtonAction) forControlEvents:UIControlEventTouchUpInside];
    self.photoImage.contentMode = UIViewContentModeScaleAspectFill;
    self.photoImage.clipsToBounds = YES;
    NSArray *normal = [NSArray arrayWithObjects:@"简约－点击前",@"日范－点击前",@"炫酷－点击前",@"清新－点击前",@"素白－点击前",@"艳丽－点击前",@"中国风",@"sex-点击前",@"美范－点击前",@"可爱－点击前",@"高雅－点击前",@"欧范－点击前", nil];
    NSArray *high = [NSArray arrayWithObjects:@"简约－点击后",@"日范－点击后",@"炫酷－点击后",@"清新－点击后",@"素白－点击后",@"艳丽－点击后",@"中国风副本－点击后",@"sex-点击后",@"美范－点击后",@"可爱－点击后",@"高雅－点击后",@"欧范－点击后",nil];
    for(int i = 1;i<[normal count]+1;i++)
    {
        UIButton *button = (UIButton *)[self.allButtonView viewWithTag:i];
        if([button isKindOfClass:[UIButton class]])
        {
            [button setImage:[UIImage imageNamed:[normal objectAtIndex:i-1]] forState:UIControlStateNormal];
            [button setImage:[UIImage imageNamed:[high objectAtIndex:i-1]] forState:UIControlStateSelected];
            [button addTarget:self action:@selector(selectStyleAction:) forControlEvents:UIControlEventTouchUpInside];
            if(i==1)
            {
                button.selected = YES;
            }
        }
    }
}
-(void)selectStyleAction:(UIButton *)button
{
    button.selected = !button.selected;
    for(int i = 1;i<13;i++)
    {
        if(i!=button.tag){
            UIButton *b = (UIButton *)[self.allButtonView viewWithTag:i];
            if([b isKindOfClass:[UIButton class]])
            {
                b.selected = NO;
            }
        }
    }
}
-(void)rightAction
{
    LoginViewController *lVC = [[LoginViewController alloc]initWithNibName:@"LoginViewController" bundle:nil];
    [self.navigationController pushViewController:lVC animated:YES];
}
-(void)addImageAction
{
    //添加照片
    SharePlatformView *ac = [[SharePlatformView alloc]initWithTarget:self AndSelectAction:@selector(selectAction)];
    [ac showInView:self.view];
}
-(void)selectAction
{
    ImagePickerViewController *pickVC = [[ImagePickerViewController alloc]initWithNibName:@"ImagePickerViewController" bundle:nil];
    pickVC.delegate = self;
    [self presentViewController:pickVC animated:YES completion:nil];
}
-(void)imageDidSelected:(int)index
{
    self.photoType = index;
    NSArray *ar = [NSArray arrayWithObjects:@"photo1",@"photo2",@"photo3",@"photo4",@"photo5",@"photo6",nil];
    self.photoImage.image = [UIImage imageNamed:[ar objectAtIndex:(index-1)]];
    self.heatButton.hidden = NO;
}
-(void)cupButtonAction
{
    self.allButtonView.hidden = NO;
}

-(void)heatButtonAction
{
    NSString *moviewUrl = [NSString stringWithFormat:@"%d-%d",self.cupType+1,self.photoType];
    NSLog(@"%@",moviewUrl);
    Mp4ViewController *mvc = [[Mp4ViewController alloc]initWithNibName:@"Mp4ViewController" bundle:nil];
    mvc.moviewURL = moviewUrl;
    mvc.delegate = self;
    [self presentViewController:mvc animated:NO completion:nil];
}
-(void)mp4Dismiss
{
    self.rightButton.hidden = NO;
}
-(void)backAction
{
    if(self.allButtonView.hidden == YES)
    {
       [self.navigationController popViewControllerAnimated:YES];
    }
    else{
        self.allButtonView.hidden = YES;
        self.rightButton.hidden = YES;
        self.heatButton.hidden = YES;
        self.photoImage.image = nil;
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
