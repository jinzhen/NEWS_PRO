//
//  UserInfo.m
//  News
//
//  Created by lihaijin on 14-12-22.
//  Copyright (c) 2014年 lihaijin. All rights reserved.
//

#import "UserInfo.h"

@implementation UserInfo

- (id)initWithDic:(NSDictionary *)userDic
{
    if (self = [super init]) {
            self.userName = @"";
            self.userPswd = @"";
            self.userPhoneNumber = @"";
            self.userID = @"";
            self.userAvatarUrl = @"";
            self.userIdentify = @"";
            self.userSSNID = @"";
            self.userLoginDate = @"";
            self.availableScore = 0;
            self.userLevel = 0;
            self.gender = WOMEN;
    }
    
    if (!userDic) {
        return self;
    }
    
    if ([userDic objectForKey:kUserName]) {
        self.userName = [userDic objectForKey:kUserName];
    }
    
    if ([userDic objectForKey:kUserPWD]) {
        self.userPswd = [userDic objectForKey:kUserPWD];
    }
    
    if ([userDic objectForKey:kUserPhoneNumber]) {
        self.userPhoneNumber = [userDic objectForKey:kUserPhoneNumber];
    }
    
    if ([userDic objectForKey:kUserID]) {
        self.userID = [userDic objectForKey:kUserID];
    }
    
    if ([userDic objectForKey:kUserAvatarUrl]) {
        self.userAvatarUrl = [userDic objectForKey:kUserAvatarUrl];
    }
    
    if ([userDic objectForKey:kUserIdentify]) {
        self.userIdentify = [userDic objectForKey:kUserIdentify];
    }
    
    if ([userDic objectForKey:kUserSSNID]) {
        self.userSSNID = [userDic objectForKey:kUserSSNID];
    }
    
    if ([userDic objectForKey:kUserLoginDate]) {
        self.userLoginDate = [userDic objectForKey:kUserLoginDate];
    }
    
    
    self.availableScore = [[userDic objectForKey:kUserAvailableScore] intValue];
    self.userLevel = [[userDic objectForKey:kUserLevel] intValue];
    self.gender = [[userDic objectForKey:kUserGender] intValue];

    
    return self;
}

- (void)dealloc
{
    self.userName = nil;
    self.userPswd = nil;
    self.userPhoneNumber = nil;
    self.userID = nil;
    self.userAvatarUrl = nil;
    self.userIdentify = nil;
    self.userSSNID = nil;
    self.userLoginDate = nil;
    self.availableScore = 0;
    self.userLevel = 0;
    self.gender = WOMEN;
    
    [super dealloc];
}

- (NSMutableDictionary *)getUserDic
{
    NSMutableDictionary *dic = [[[NSMutableDictionary alloc] init] autorelease];
    
    if (self.userName) {
        [dic setObject:self.userName forKey:kUserName];
    }
    
    if (self.userPswd) {
        [dic setObject:self.userPswd forKey:kUserPWD];
    }
    
    if (self.userPhoneNumber) {
        [dic setObject:self.userPhoneNumber forKey:kUserPhoneNumber];
    }
    
    if (self.userID) {
        [dic setObject:self.userID forKey:kUserID];
    }
    
    if (self.userIdentify) {
        [dic setObject:self.userIdentify forKey:kUserIdentify];
    }
    
    if (self.userAvatarUrl) {
        [dic setObject:self.userAvatarUrl forKey:kUserAvatarUrl];
    }
    
    if (self.userLoginDate) {
        [dic setObject:self.userLoginDate forKey:kUserLoginDate];
    }
    
    if (self.userSSNID) {
        [dic setObject:self.userSSNID forKey:kUserSSNID];
    }
    
    [dic setObject:[NSString stringWithFormat:@"%d", self.availableScore] forKey:kUserAvailableScore];
    [dic setObject:[NSString stringWithFormat:@"%d", self.userLevel] forKey:kUserLevel];
    [dic setObject:[NSString stringWithFormat:@"%d", self.gender] forKey:kUserGender];
    
    return dic;
}

@end
