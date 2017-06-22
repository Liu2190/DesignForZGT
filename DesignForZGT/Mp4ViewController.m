//
//  Mp4ViewController.m
//  DesignForZGT
//
//  Created by liuxiaodan on 14-5-17.
//  Copyright (c) 2014年 liuxiaodan. All rights reserved.
//

#import "Mp4ViewController.h"

@interface Mp4ViewController ()
{
    UIImageView *loading1;
    UIImageView *loading2;
    UIButton *button;
    int timeInter;
}
@property (nonatomic,retain)NSTimer *timer;
@end

@implementation Mp4ViewController
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(backAction)];
        [self.view addGestureRecognizer:tap];
    }
    return self;
}
-(void)backAction
{
    [mp stop];
    [self.delegate mp4Dismiss];
    [[UIApplication sharedApplication]setStatusBarHidden:NO];
    [[UIApplication sharedApplication]setStatusBarOrientation:UIInterfaceOrientationPortrait animated:NO];
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)backAction:(UIButton *)sender
{
    [mp stop];
    [self.delegate mp4Dismiss];
    [[UIApplication sharedApplication]setStatusBarHidden:NO];
    [[UIApplication sharedApplication]setStatusBarOrientation:UIInterfaceOrientationPortrait animated:NO];
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [[UIApplication sharedApplication]setStatusBarHidden:YES];
    [[UIApplication sharedApplication]setStatusBarOrientation:UIInterfaceOrientationLandscapeRight animated:NO];
    [[self view]setBounds:CGRectMake(0, 0, 568, 320)];
    [[self view]setCenter:CGPointMake(160, 568/2)];
    [[self view]setTransform:CGAffineTransformMakeRotation(M_PI/2)];
    self.view.backgroundColor = [UIColor blackColor];
    loading1 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"videoback"]];
    loading1.frame = CGRectMake(0, 0, 213/8, 716/8);
    CGPoint center = self.view.center;
    loading1.center = center;
    [self.view addSubview:loading1];
    loading2 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"videoback2"]];
    loading2.frame = CGRectMake(2.5, 228/8-7, 12/8, 4.5);
    [loading1 addSubview:loading2];
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(runTimePage) userInfo:nil repeats:YES];
}
-(void)runTimePage
{
    timeInter++;
    CGRect frame = loading2.frame;
    frame.size.height =frame.size.height+4.5;
    loading2.frame = frame;
    if(timeInter==15)
    {
        [self.timer invalidate];
        timeInter = 0;
        [loading2 removeFromSuperview];
        [loading1 removeFromSuperview];
        [[UIApplication sharedApplication]setStatusBarOrientation:UIInterfaceOrientationLandscapeRight animated:NO];
        [[self view]setBounds:CGRectMake(0, 0, 568, 320)];
        [[self view]setCenter:CGPointMake(160, 568/2)];
        [[self view]setTransform:CGAffineTransformMakeRotation(M_PI/2)];
        button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(0, 0, 90, 90);
        button.center = CGPointMake(568/2, 160);
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
        [button setImage:[UIImage imageNamed:@"playImage"] forState:UIControlStateNormal];
    }
}
-(void)moviePlayerLoadStateChanged:(NSNotification *)nitification
{
    if([mp loadState]!=MPMovieLoadStateUnknown)
    {
        [[NSNotificationCenter defaultCenter]removeObserver:self name:MPMoviePlayerLoadStateDidChangeNotification object:nil];
       // [[UIApplication sharedApplication]setStatusBarOrientation:UIInterfaceOrientationLandscapeRight animated:NO];
        [[UIApplication sharedApplication]setStatusBarOrientation:UIInterfaceOrientationLandscapeRight animated:NO];
        [[self view]setBounds:CGRectMake(0, 0, 568, 320)];
        [[self view]setCenter:CGPointMake(160, 568/2)];
        [[self view]setTransform:CGAffineTransformMakeRotation(M_PI/2)];
        [[mp view]setFrame:CGRectMake(0, 0, 568, 320)];
        [mp setScalingMode:MPMovieScalingModeFill];
        //[mp setScalingMode:<#(MPMovieScalingMode)#>]
        UIButton *but = [UIButton buttonWithType:UIButtonTypeCustom];
        [but addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
        but.backgroundColor = [UIColor clearColor];
        but.frame = CGRectMake(0, 0, 538, 320);
        [self.view addSubview:mp.view];
        button.center = mp.view.center;
        [self.view addSubview:but];
        [self.view bringSubviewToFront:button];
        [mp play];
    }
}
-(void)buttonAction:(UIButton *)sender
{
    if(sender.imageView.image == [UIImage imageNamed:@"playImage"])
    {
        [self readyPalyer];
    }
    else if(sender.imageView.image == [UIImage imageNamed:@"pauseImage"])
    {
        [mp play];
    }
    else{
        [sender setImage:[UIImage imageNamed:@"playImage"] forState:UIControlStateNormal];
        [mp pause];
    }
}
-(void)moviePlayBackDidFinish:(NSNotification *)notification
{
    [button setImage:[UIImage imageNamed:@"playImage"] forState:UIControlStateNormal];
    [[NSNotificationCenter defaultCenter]removeObserver:self name:MPMoviePlayerPlaybackDidFinishNotification object:nil];
   // [self dismissViewControllerAnimated:NO completion:nil];
}

-(void)readyPalyer
{
    [button setImage:nil forState:UIControlStateNormal];
    mp= [[MPMoviePlayerController alloc]init];
    [mp setContentURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:self.moviewURL ofType:@"mp4"]]];
    NSLog(@"self.moviewURL %@",self.moviewURL);
    if([mp respondsToSelector:@selector(loadState)])
    {
        mp.controlStyle = MPMovieControlStyleNone;
        //mp.controlStyle = MPMovieControlStyleEmbedded;
        //[mp setControlStyle:MPMovieControlStyleFullscreen];
        [mp setFullscreen:YES];
        [mp prepareToPlay];
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(moviePlayerLoadStateChanged:) name:MPMoviePlayerLoadStateDidChangeNotification object:nil];
    }
    else
    {
        [mp play];
    }
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(moviePlayBackDidFinish:) name:MPMoviePlayerPlaybackDidFinishNotification object:nil];
}
-(BOOL)prefersStatusBarHidden{
    return YES;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
