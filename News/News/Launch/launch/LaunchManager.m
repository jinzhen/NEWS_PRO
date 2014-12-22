//
//  LaunchManager.m
//  News
//
//  Created by lihaijin on 14-12-22.
//  Copyright (c) 2014年 lihaijin. All rights reserved.
//

#import "LaunchManager.h"

@implementation LaunchManager

SYNTHESIZE_SINGLETON_FOR_CLASS(LaunchManager);

- (id)init
{
    if (self = [super init]) {
        
    }
    
    return self;
}

- (void)dealloc
{
    [super dealloc];
}

#pragma mark -
#pragma mark launch step
- (void)setupLaunchingStep
{
    
}

- (void)doAutoLoginStep
{
    
}

- (void)doLoginStep
{
    
}

- (void)doRegisterStep
{
    
}

#pragma mark -
#pragma mark version alert
- (void)checkVersion
{
    
}

#pragma mark -
#pragma mark get launch image
- (void)getLaunchImage
{
    
}

@end
