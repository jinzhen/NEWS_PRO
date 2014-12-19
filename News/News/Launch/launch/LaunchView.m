//
//  LaunchView.m
//  News
//
//  Created by lihaijin on 14-12-19.
//  Copyright (c) 2014年 lihaijin. All rights reserved.
//

#import "LaunchView.h"

@interface LaunchView ()

@property (nonatomic, retain) UIImageView *imageView;

@end

@implementation LaunchView

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor redColor];
        [self setupViews];
        
        [self performSelector:@selector(afterDisplayLaunchView) withObject:nil afterDelay:3.0f];
    }
    
    return self;
}

- (void)dealloc
{
    self.imageView = nil;
    
    [super dealloc];
}

- (void)setupViews
{
    _imageView = [[UIImageView alloc] initWithFrame:self.bounds];
    _imageView.contentMode = UIViewContentModeScaleAspectFit;
    _imageView.backgroundColor = [UIColor blackColor];
    _imageView.image = [UIImage imageNamed:@"launch_screen"];
    
    [self addSubview:_imageView];
}

- (void)afterDisplayLaunchView
{
    [UIView animateWithDuration:0.3f animations:^{
        self.alpha = 0.0f;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

+ (void)showLaunchView
{
    UIView *window = nil;
    NSArray *windows = [[UIApplication sharedApplication] windows];
    if ([windows count]) {
        window = windows[0];
    }
    
    if (window) {
        LaunchView *launchView = [[LaunchView alloc] initWithFrame:kScreenBounds];
        [window addSubview:launchView];
        [launchView release];
    }
}

@end
