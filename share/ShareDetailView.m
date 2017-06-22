//
//  ShareDetailView.m
//  SLDBuyer
//
//  Created by liuxiaodan on 14-5-26.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import "ShareDetailView.h"

@implementation ShareDetailView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
-(void)awakeFromNib
{
    [self.selectButton setImage:[UIImage imageNamed:@"selectNormal"] forState:UIControlStateNormal];
    [self.selectButton setImage:[UIImage imageNamed:@"selectHigh"] forState:UIControlStateHighlighted];
    [self.cancelButton setImage:[UIImage imageNamed:@"cancelSelectNormal"] forState:UIControlStateNormal];
    [self.cancelButton setImage:[UIImage imageNamed:@"cancelSelectHigh"] forState:UIControlStateHighlighted];
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
