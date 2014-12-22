//
//  UserInfo.h
//  News
//
//  Created by lihaijin on 14-12-22.
//  Copyright (c) 2014年 lihaijin. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kUserIdentify @"identify"
#define kUserLoginDate @"login_date"
#define kUserAvatarUrl @"ava_url"
#define kUserPhoneNumber @"user_name"
#define kUserName @"user_nknm"
#define kUserPWD @"userPswd"
#define kUserID @"user_id"
#define kUserGender @"user_sexy"
#define kUserLevel @"user_lvl"
#define kUserAvailableScore @"crdt_cnt"
#define kUserUnreadCount @"user_urd_cnt"
#define kUserSSNID @"ssn_id"

typedef enum {
    WOMEN = 0,
    MAN = 1,
}GENDER_TYPE;


@interface UserInfo : NSObject

/*
 identify = 22A559BFE3AB45B3A115C6ECE94C1AD4;
 "login_date" = 20141222093053;
 "rtn_cd" = 0;
 "rtn_msg" = "\U767b\U5f55\U6210\U529f\Uff01";
 "ssn_id" = e68830j2awhfa1ywyxye;
 userName = 18885089501;
 userPswd = 111111;
 "user_id" = PKUS70000671;
 
 "acrdt_cnt" = 6;
 "ava_url" = "http://api.gzkbapp.com:80/gzdsb/upload/dsb04/avaters/201412/201412221324233980.jpg";
 "crdt_cnt" = 6;
 "dst_flg" = C01;
 "user_lvl" = 0;
 "user_name" = 18885089501;
 "user_nknm" = "\U548c\U8c10";
 "user_sexy" = 1;
 "user_urd_cnt" = 0;
 
 */

@property (nonatomic, retain) NSString *userName;
@property (nonatomic, retain) NSString *userPswd;
@property (nonatomic, retain) NSString *userPhoneNumber;
@property (nonatomic, retain) NSString *userID;
@property (nonatomic, retain) NSString *userAvatarUrl;
@property (nonatomic, retain) NSString *userIdentify;
@property (nonatomic, retain) NSString *userSSNID;
@property (nonatomic, retain) NSString *userLoginDate;
@property (nonatomic, assign) int availableScore;
@property (nonatomic, assign) int userLevel;
@property (nonatomic, assign) GENDER_TYPE gender;

- (id)initWithDic:(NSDictionary *)userDic;

- (NSMutableDictionary *)getUserDic;

@end
