//
//  NSString_JSONKit.h
//  dushibao
//
//  Created by wanjia on 14/12/2.
//  Copyright (c) 2014年 pmy. All rights reserved.
//

#import <Foundation/Foundation.h>

#define ExistNSNullValue   @"ExistNSNullValue"

@interface NSString (JSONKit)


/* 将json字符串转化为字典或数组类型。*/
-(id)JSONKitValue;


/* 
 将json字符串转化为字典或数组类型。
 如果value值存在NSNull类型，在当前字典或数组中增加[key:ExistNSNullValue，value:ExistNSNullValue]键值对。（采用深度查找,"当前字典"的含义是指该value所在的那个字典，不包含外层和内层的字典）
 */
-(id)JSONKitValueForMarkTag;


/* 将json字符串转化为字典或数组类型。如果value值存在NSNull类型，将该NSNull值改成空字符串@“”。*/
-(id)JSONKitValueFilterNull;


@end
