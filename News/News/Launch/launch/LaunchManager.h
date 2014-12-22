//
//  LaunchManager.h
//  News
//
//  Created by lihaijin on 14-12-22.
//  Copyright (c) 2014年 lihaijin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LaunchManager : NSObject

DEFINE_SINGLETON_FOR_CLASS(LaunchManager);

- (void)setupLaunchingStep;

- (void)doLoginStep;

- (void)doRegisterStep;

- (void)doAutoLoginStep;

@end
