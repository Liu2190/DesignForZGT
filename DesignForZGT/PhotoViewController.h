//
//  PhotoViewController.h
//  DesignForZGT
//
//  Created by liuxiaodan on 14-5-11.
//  Copyright (c) 2014年 liuxiaodan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *rightButton;
@property (weak, nonatomic) IBOutlet UIButton *leftButton;
@property (weak, nonatomic) IBOutlet UIView *allButtonView;
@property (weak, nonatomic) IBOutlet UIButton *addImageButton;
@property (weak, nonatomic) IBOutlet UIButton *cupButton;
@property (weak, nonatomic) IBOutlet UIButton *heatButton;
@property (weak, nonatomic) IBOutlet UIImageView *photoImage;
@property (nonatomic,assign)int cupType;
@end
