//
//  KBTools.h
//  dushibao
//
//  Created by lihaijin on 14-12-8.
//  Copyright (c) 2014年 pmy. All rights reserved.
//

#import <Foundation/Foundation.h>

#define TIME_FORMAT @"yyyy-MM-dd HH:mm:ss"

@interface KBTools : NSObject

+ (NSTimeInterval)getTimeIntervalWithString:(NSString *)timeStr;
+ (NSString *)getTimeStringWithTimeInterval:(NSTimeInterval)time;

+ (NSString *)getWiseDateString:(int32_t)aiDT;


@end
