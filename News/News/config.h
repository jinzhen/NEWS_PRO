//
//  config.h
//  News
//
//  Created by lihaijin on 14-12-12.
//  Copyright (c) 2014年 lihaijin. All rights reserved.
//

#ifndef News_config_h
#define News_config_h

/*
 server config
 */
#define kServerTest 1
#define kServerPro  2

#define kSelectServer kServerTest



#if (kSelectServer == kServerPro)

#else


#endif


/*
 comon use size
 */
#define kScreenWidth     [[UIScreen mainScreen] bounds].size.width
#define kScreenHeight    [[UIScreen mainScreen] bounds].size.height
#define kScreenSize      [[UIScreen mainScreen] bounds].size
#define kStatusBarHeight [[UIApplication sharedApplication] statusBarFrame].size.height
#define kStatusBarWidth  [[UIApplication sharedApplication] statusBarFrame].size.width

/*
 localized
 */
#define NSLocalizedStringEx(key, comment) \
[[NSBundle mainBundle] localizedStringForKey:(key) value:@"" table:@"Localizable"]


/*
 config log
 */

#if 1
#   define NSLog(fmt, ...)  NSLog((@"\n[func:%s][line:%d]" fmt "\n"), __FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#   define NSLog(fmt, ...)
#endif


/*
 ios version
 */
#define iOS7  ( [[[UIDevice currentDevice] systemVersion] compare:@"7.0"] != NSOrderedAscending )
#define iOS8  ( [[[UIDevice currentDevice] systemVersion] compare:@"8.0"] != NSOrderedAscending )

/*
 iphone device
 */
#define IPHONE5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640.0f, 1136.0f), [[UIScreen mainScreen] currentMode].size) : NO)






/*
 share class
 */
#define DEFINE_SINGLETON_FOR_CLASS(classname) \
+ (classname*)shared##classname;


#define GET_SINGLETON_FOR_CLASS(classname) \
[classname shared##classname]


#define SYNTHESIZE_SINGLETON_FOR_CLASS(classname) \
\
static classname *shared##classname = nil; \
\
+ (classname *)shared##classname \
{ \
@synchronized(self) \
{ \
if (shared##classname == nil) \
{ \
shared##classname = [[self alloc] init]; \
} \
} \
\
return shared##classname; \
} \
\
+ (id)allocWithZone:(NSZone *)zone \
{ \
@synchronized(self) \
{ \
if (shared##classname == nil) \
{ \
shared##classname = [super allocWithZone:zone]; \
return shared##classname; \
} \
} \
\
return nil; \
} \
\
- (id)copyWithZone:(NSZone *)zone \
{ \
return self; \
} \
\
- (id)retain \
{ \
return self; \
} \
\
- (NSUInteger)retainCount \
{ \
return NSUIntegerMax; \
} \
\
- (oneway void)release \
{ \
} \
\
- (id)autorelease \
{ \
return self; \
}



//end
#endif
