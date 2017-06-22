//
//  ImagePickerViewController.m
//  DesignForZGT
//
//  Created by liuxiaodan on 14-5-17.
//  Copyright (c) 2014年 liuxiaodan. All rights reserved.
//

#import "ImagePickerViewController.h"

@interface ImagePickerViewController ()

@end

@implementation ImagePickerViewController

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
    // Do any additional setup after loading the view from its ni;b.
    [self.cancleButton setImage:[UIImage imageNamed:@"photoCancelHigh"] forState:UIControlStateHighlighted];
    [self.cancleButton setImage:[UIImage imageNamed:@"photoCancel"] forState:UIControlStateNormal];
    [self.finishButton setImage:[UIImage imageNamed:@"photoFinishHigh"] forState:UIControlStateHighlighted];
    [self.finishButton setImage:[UIImage imageNamed:@"photoFinish"] forState:UIControlStateNormal];
    [self.button1 setImage:[UIImage imageNamed:@"photo1Hgh"] forState:UIControlStateSelected];
    [self.button1 setImage:[UIImage imageNamed:@"photo1"] forState:UIControlStateNormal];
    [self.button2 setImage:[UIImage imageNamed:@"photo2Hgh"] forState:UIControlStateSelected];
    [self.button2 setImage:[UIImage imageNamed:@"photo2"] forState:UIControlStateNormal];
    [self.button3 setImage:[UIImage imageNamed:@"photo3Hgh"] forState:UIControlStateSelected];
    [self.button3 setImage:[UIImage imageNamed:@"photo3"] forState:UIControlStateNormal];
    [self.button4 setImage:[UIImage imageNamed:@"photo4Hgh"] forState:UIControlStateSelected];
    [self.button4 setImage:[UIImage imageNamed:@"photo4"] forState:UIControlStateNormal];
    [self.button5 setImage:[UIImage imageNamed:@"photo5Hgh"] forState:UIControlStateSelected];
    [self.button5 setImage:[UIImage imageNamed:@"photo5"] forState:UIControlStateNormal];
    [self.button6 setImage:[UIImage imageNamed:@"photo6Hgh"] forState:UIControlStateSelected];
    [self.button6 setImage:[UIImage imageNamed:@"photo6"] forState:UIControlStateNormal];

    [self.cancleButton addTarget:self action:@selector(cancleAction) forControlEvents:UIControlEventTouchUpInside];
    [self.finishButton addTarget:self action:@selector(finishAction) forControlEvents:UIControlEventTouchUpInside];
    [self.button1 addTarget:self action:@selector(selectImage:) forControlEvents:UIControlEventTouchUpInside];
    [self.button2 addTarget:self action:@selector(selectImage:) forControlEvents:UIControlEventTouchUpInside];
    [self.button3 addTarget:self action:@selector(selectImage:) forControlEvents:UIControlEventTouchUpInside];
    [self.button4 addTarget:self action:@selector(selectImage:) forControlEvents:UIControlEventTouchUpInside];
    [self.button5 addTarget:self action:@selector(selectImage:) forControlEvents:UIControlEventTouchUpInside];
    [self.button6 addTarget:self action:@selector(selectImage:) forControlEvents:UIControlEventTouchUpInside];
}
-(void)selectImage:(UIButton *)sender
{
    sender.selected = !sender.selected;
    if(sender!=self.button1)
    {
        self.button1.selected = NO;
    }
    if(sender!=self.button2)
    {
        self.button2.selected = NO;
    }
    if(sender!=self.button3)
    {
        self.button3.selected = NO;
    }
    if(sender!=self.button4)
    {
        self.button4.selected = NO;
    }
    if(sender!=self.button5)
    {
        self.button5.selected = NO;
    }
    if(sender!=self.button6)
    {
        self.button6.selected = NO;
    }
    
}
-(void)finishAction
{
    if(self.button1.selected == YES)
    {
        if(self.delegate && [self.delegate respondsToSelector:@selector(imageDidSelected:)])
        {
            [self.delegate imageDidSelected:1];
            [self dismissViewControllerAnimated:YES completion:nil];
        }
       
    }
    else if(self.button2.selected == YES)
    {
        if(self.delegate && [self.delegate respondsToSelector:@selector(imageDidSelected:)])
        {
            [self.delegate imageDidSelected:2];
            [self dismissViewControllerAnimated:YES completion:nil];
        }

    }
    else if(self.button3.selected == YES)
    {
        if(self.delegate && [self.delegate respondsToSelector:@selector(imageDidSelected:)])
        {
            [self.delegate imageDidSelected:3];
            [self dismissViewControllerAnimated:YES completion:nil];
        }

    }
    else if(self.button4.selected == YES)
    {
        if(self.delegate && [self.delegate respondsToSelector:@selector(imageDidSelected:)])
        {
            [self.delegate imageDidSelected:4];
            [self dismissViewControllerAnimated:YES completion:nil];
        }
        
    }
    else if(self.button5.selected == YES)
    {
        if(self.delegate && [self.delegate respondsToSelector:@selector(imageDidSelected:)])
        {
            [self.delegate imageDidSelected:5];
            [self dismissViewControllerAnimated:YES completion:nil];
        }
        
    }
    else if(self.button6.selected == YES)
    {
        if(self.delegate && [self.delegate respondsToSelector:@selector(imageDidSelected:)])
        {
            [self.delegate imageDidSelected:6];
            [self dismissViewControllerAnimated:YES completion:nil];
        }
        
    }
    else
    {
        UIAlertView *al = [[UIAlertView alloc]initWithTitle:@"请选择照片" message:nil delegate:nil cancelButtonTitle:@"好的" otherButtonTitles:nil, nil];
        [al show];
    }
}
-(void)cancleAction
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
