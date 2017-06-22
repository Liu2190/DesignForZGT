//
//  SharePlatformView.h
//  SLDBuyer
//
//  Created by liuxiaodan on 14-5-26.
//  Copyright (c) 2014年 shanglin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SharePlatformView : UIView
-(id)initWithTarget:(id)target AndSelectAction:(SEL)selectAction;
- (void)showInView:(UIView *)view;
@end
