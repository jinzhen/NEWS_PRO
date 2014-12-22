//
//  KBTools.m
//  dushibao
//
//  Created by lihaijin on 14-12-8.
//  Copyright (c) 2014年 pmy. All rights reserved.
//

#import "KBTools.h"

@implementation KBTools

+ (NSTimeInterval)getTimeIntervalWithString:(NSString *)timeStr
{
    NSString *timeString = [timeStr stringByReplacingOccurrencesOfString:@".0" withString:@""];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
    [formatter setDateFormat:TIME_FORMAT];
    NSDate *date = [formatter dateFromString:timeString];
    
    NSTimeInterval time = date.timeIntervalSince1970;
    
    return time;
}

+ (NSString *)getTimeStringWithTimeInterval:(NSTimeInterval)time
{
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:time];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    [dateFormatter setTimeStyle:NSDateFormatterShortStyle];

    [dateFormatter setDateFormat:TIME_FORMAT];

    
    NSString* dateString = [dateFormatter stringFromDate:date];
    dateString = [dateString stringByAppendingString:@".0"];
    
    return dateString;
}

// aiDT 是从某个特定的日期到指定的日期经过的时长（单位：秒）
+ (NSString *)getDateTimeString:(int32_t)aiDT
{
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:aiDT];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    [dateFormatter setTimeStyle:NSDateFormatterShortStyle];
    
    [dateFormatter setDateFormat:@"yyyy.MM.dd HH:mm:ss"];
    
    NSString* lpDT = [dateFormatter stringFromDate:date];
    
    return lpDT;
}

+ (NSString *)getHMSTimeString:(int32_t)aiDT
{
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:aiDT];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    [dateFormatter setTimeStyle:NSDateFormatterShortStyle];
    
    [dateFormatter setDateFormat:@"HH:mm:ss"];
    
    NSString* lpDT = [dateFormatter stringFromDate:date];
    
    return lpDT;
}

+ (NSString *)getWiseDateString:(int32_t)aiDT
{
    NSString *apStr = [KBTools getDateTimeString:aiDT];
    NSString *timeStr = [KBTools getHMSTimeString:aiDT];
    
    NSString *str=[apStr substringToIndex:10];
    NSString *returnDateString=nil;
    //构造今天日期的字符串
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    [dateFormatter setTimeStyle:NSDateFormatterShortStyle];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    //－－注意: 当前系统时间跟具体机器的设置有关，如果用户对机器时间的设置不是以公历日期，则会出现问题
    NSString *currentDate=[dateFormatter stringFromDate:[NSDate date]];
    NSRange yearRange,monthRange,dayRange;
    yearRange.location=0;
    yearRange.length=4;
    monthRange.location=5;
    monthRange.length=2;
    dayRange.location=8;
    dayRange.length=2;
    //昨天与今天同年
    if ([[currentDate substringWithRange:yearRange] isEqualToString:[str substringWithRange:yearRange]]) {
        //----昨天与今天同月
        if ([[currentDate substringWithRange:monthRange] isEqualToString:[str substringWithRange:monthRange]]) {
            //昨天，，，，注意：昨天与今天的日位数不同（如：今天是10号，占两位－－－昨天是9号，占一位）要进行判断
            if ([[[NSString stringWithFormat:@"%d",[[currentDate substringWithRange:dayRange] intValue]-1] length]==1?[NSString stringWithFormat:@"0%@",[NSString stringWithFormat:@"%d",[[currentDate substringWithRange:dayRange] intValue]-1]]:[NSString stringWithFormat:@"%d",[[currentDate substringWithRange:dayRange] intValue]-1] isEqualToString:[str substringWithRange:dayRange]]) {
                returnDateString = @"昨天";
            }else{
                //今天
                if ([[currentDate substringWithRange:dayRange] isEqualToString:[str substringWithRange:dayRange]]) {
                    returnDateString = @"今天";
                }else{
                    //                    returnDateString=[NSString stringWithFormat:@"%d月%d日",[[str substringWithRange:monthRange] intValue],[[str substringWithRange:dayRange] intValue]];
                    //add by lixl 日期显示格式为：“11-03”   11-05
                    returnDateString=[NSString stringWithFormat:@"%@-%@",[str substringWithRange:monthRange],[str substringWithRange:dayRange]];
                }
            }
            //----昨天与今天不同月
        }else{
            //昨天与今天如果不同月，，则昨天肯定是上个月的最后一天，今天是当前这个月的第一天，整个判断步骤分两步，1.先构建昨天日期的字符串  2.然后去比较昨天是否与系统中的字符串相符
            //1.构造昨天的日期字符串
            NSArray *month31days=[[NSArray alloc]initWithObjects:@"01",@"03",@"05",@"07",@"08",@"10",@"12", nil];
            NSArray *month30days=[[NSArray alloc]initWithObjects:@"04",@"06",@"09",@"11", nil];
            NSString *yesterdayMonth=[[currentDate substringWithRange:monthRange] intValue]-1<10?[NSString stringWithFormat:@"0%d",[[currentDate substringWithRange:monthRange] intValue]-1]:[NSString stringWithFormat:@"%d",[[currentDate substringWithRange:monthRange] intValue]-1];
            NSString *yesterdayDate;
            //如果上个月是大月
            if ([month31days containsObject:yesterdayMonth]) {
                yesterdayDate=[NSString stringWithFormat:@"%@-%@-31",[currentDate substringWithRange:yearRange],yesterdayMonth];
            }else{
                //如果上个月是小月
                if ([month30days containsObject:yesterdayMonth]) {
                    yesterdayDate=[NSString stringWithFormat:@"%@-%@-30",[currentDate substringWithRange:yearRange],yesterdayMonth];
                }else{
                    //上个月是二月
                    //如果是闰年则当月的天数为29天，否则28天
                    if (([[currentDate substringWithRange:yearRange] intValue]%4==0&&[[currentDate substringWithRange:yearRange] intValue]%100!=0)||[[currentDate substringWithRange:yearRange] intValue]%400==0) {
                        yesterdayDate=[NSString stringWithFormat:@"%@-%@-29",[currentDate substringWithRange:yearRange],yesterdayMonth];
                    }else{
                        yesterdayDate=[NSString stringWithFormat:@"%@-%@-28",[currentDate substringWithRange:yearRange],yesterdayMonth];
                    }
                }
            }
            //2.比较
            if ([str isEqualToString:yesterdayDate]) {
                returnDateString = @"昨天";
            }else{
                //                returnDateString=[NSString stringWithFormat:@"%d月%d日",[[str substringWithRange:monthRange] intValue],[[str substringWithRange:dayRange] intValue]];
                //add by lixl 日期显示格式为：“11-03”   11-05
                returnDateString=[NSString stringWithFormat:@"%@-%@",[str substringWithRange:monthRange],[str substringWithRange:dayRange]];
            }
        }
        //昨天与今天不同年,昨天是去年的最后一天，今天是当年的第一天
    }else{
        NSString *lastYear=[NSString stringWithFormat:@"%d-12-31",[[currentDate substringWithRange:yearRange] intValue]-1];
        if ([lastYear isEqualToString:str]) {
            returnDateString = @"昨天";
        }else{
            returnDateString=[NSString stringWithFormat:@"%@-%d-%d",[str substringWithRange:yearRange],[[str substringWithRange:monthRange] intValue],[[str substringWithRange:dayRange] intValue]];
        }
    }
    
    returnDateString = [NSString stringWithFormat:@"%@ %@", returnDateString, timeStr];
    
    return returnDateString;
}

+ (NSString *)getAppDocumentDirectory
{
    NSArray* lpPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    if([lpPaths count]>0)
        return [lpPaths objectAtIndex:0];
    else
        return nil;
}

@end
