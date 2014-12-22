//
//  UserInfoManager.h
//  News
//
//  Created by lihaijin on 14-12-22.
//  Copyright (c) 2014年 lihaijin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserInfo.h"

#define kUserInfo @"userInfo"

@interface UserInfoManager : NSObject

DEFINE_SINGLETON_FOR_CLASS(UserInfoManager);

@property (nonatomic, retain) NSUserDefaults *userDefaults;
@property (nonatomic, retain) UserInfo *userInfo;

@end
