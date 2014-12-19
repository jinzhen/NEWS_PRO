//
//  KBTabBarViewController.h
//  News
//
//  Created by lihaijin on 14-12-17.
//  Copyright (c) 2014年 lihaijin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsListViewController.h"
#import "ConvenienceListViewController.h"
#import "InteractionListViewController.h"
#import "UserInfoViewController.h"

#define kTabBarItemCount 4
#define kTabbarItemWidth (kScreenWidth / TabbarItemCount)

typedef enum {
    TABBAR_INDEX_NEWS = 0, //新闻
    TABBAR_INDEX_CVNE = 1, //便民
    TABBAR_INDEX_INTERACT = 2, //互动
    TABBAR_INDEX_USER = 3,  //我的
}TABBAR_INDEX;


@interface KBTabBarViewController : UITabBarController

@property (nonatomic, retain) NewsListViewController *newsListViewController;
@property (nonatomic, retain) ConvenienceListViewController *convenienceListViewController;
@property (nonatomic, retain) InteractionListViewController *interactionListViewController;
@property (nonatomic, retain) UserInfoViewController *userInfoViewController;

@property (nonatomic, retain) KBNavigationController *newsListNavigationController;
@property (nonatomic, retain) KBNavigationController *convenienceNavigationController;
@property (nonatomic, retain) KBNavigationController *interactionNavigationController;
@property (nonatomic, retain) KBNavigationController *userInfoNavigationController;


@end
