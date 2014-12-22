//
//  UserInfoManager.m
//  News
//
//  Created by lihaijin on 14-12-22.
//  Copyright (c) 2014年 lihaijin. All rights reserved.
//

#import "UserInfoManager.h"

@implementation UserInfoManager

SYNTHESIZE_SINGLETON_FOR_CLASS(UserInfoManager);

- (id)init
{
    if (self = [super init]) {
        self.userDefaults = [NSUserDefaults standardUserDefaults];
        
        _userInfo = [[UserInfo alloc] initWithDic:[self.userDefaults objectForKey:kUserInfo]];
    }
    
    return self;
}

- (void)dealloc
{
    self.userInfo = nil;
    self.userDefaults = nil;
    
    [super dealloc];
}

@end
