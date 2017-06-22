//
//  Mp4ViewController.h
//  DesignForZGT
//
//  Created by liuxiaodan on 14-5-17.
//  Copyright (c) 2014年 liuxiaodan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
@protocol mp4Delegate<NSObject>
-(void)mp4Dismiss;
@end
@interface Mp4ViewController : UIViewController
{
    MPMoviePlayerController *mp ;
}
@property (nonatomic,retain)NSString *moviewURL;
@property (nonatomic,assign)id delegate;
@end
