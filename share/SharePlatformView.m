//
//  SharePlatformView.m
//  SLDBuyer
//
//  Created by liuxiaodan on 14-5-26.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import "SharePlatformView.h"
#import "ShareDetailView.h"
@interface SharePlatformView()
{
    id _target;
    SEL _selectAction;
}
@property (nonatomic,retain)ShareDetailView *detailView;
@end
@implementation SharePlatformView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
-(id)initWithTarget:(id)target AndSelectAction:(SEL)selectAction
{
    self = [super init];
    if(self)
    {
        _target = target;
        _selectAction = selectAction;
        self.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.2];
        self.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tappedCancel)];
        [self addGestureRecognizer:tap];
        [self creatButtons];
    }
    return self;
}
- (void)showInView:(UIView *)view
{
    [[[UIApplication sharedApplication]keyWindow]addSubview:self];
}
-(void)creatButtons
{
    self.detailView = [[[NSBundle mainBundle]loadNibNamed:@"ShareDetailView" owner:self options:nil]lastObject];
    [self.detailView setFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width, 0)];
    self.detailView.userInteractionEnabled = YES ;
    [self addSubview:self.detailView];
    [self.detailView.cancelButton addTarget:self action:@selector(tappedCancel) forControlEvents:UIControlEventTouchUpInside];
    [self.detailView.selectButton addTarget:self action:@selector(selectAction) forControlEvents:UIControlEventTouchUpInside];
    [UIView animateWithDuration:0.25 animations:^{
        [self.detailView setFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height-155, [UIScreen mainScreen].bounds.size.width, 155)];
    } completion:^(BOOL finished) {
    }];
}
-(void)selectAction
{
    [_target performSelector:_selectAction withObject:nil afterDelay:0];
    [self tappedCancel];
}
-(void)tappedCancel
{
    [UIView animateWithDuration:0.25 animations:^{
        [self.detailView setFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width, 0)];
        self.alpha = 0;
    } completion:^(BOOL finished) {
        if (finished) {
            [self removeFromSuperview];
        }
    }];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
