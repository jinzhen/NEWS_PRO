//
//  KBTabBarViewController.m
//  News
//
//  Created by lihaijin on 14-12-17.
//  Copyright (c) 2014年 lihaijin. All rights reserved.
//

#import "KBTabBarViewController.h"
#import "LaunchView.h"

@interface KBTabBarViewController ()


@end

@implementation KBTabBarViewController

- (id)init
{
    if (self = [super init]) {
        
    }
    
    return self;
}

- (void)dealloc
{
    self.newsListViewController = nil;
    self.newsListNavigationController = nil;
    
    self.convenienceListViewController = nil;
    self.convenienceNavigationController = nil;
    
    self.interactionListViewController = nil;
    self.interactionNavigationController = nil;
    
    self.userInfoViewController = nil;
    self.userInfoNavigationController = nil;
    
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupTabBarControllers];
    [self setupTabBarItems];
}

- (void)setupTabBarControllers
{
    NSMutableArray *navigationControllers = [[NSMutableArray alloc] initWithCapacity:kTabBarItemCount];
    
    _newsListViewController = [[NewsListViewController alloc] init];
    _newsListNavigationController = [[KBNavigationController alloc] initWithRootViewController:_newsListViewController];
    [navigationControllers addObject:_newsListNavigationController];
    
    _convenienceListViewController = [[ConvenienceListViewController alloc] init];
    _convenienceNavigationController = [[KBNavigationController alloc] initWithRootViewController:_convenienceListViewController];
    [navigationControllers addObject:_convenienceNavigationController];
    
    _interactionListViewController = [[InteractionListViewController alloc] init];
    _newsListNavigationController = [[KBNavigationController alloc] initWithRootViewController:_interactionListViewController];
    [navigationControllers addObject:_newsListNavigationController];
    
    _userInfoViewController = [[UserInfoViewController alloc] init];
    _userInfoNavigationController = [[KBNavigationController alloc] initWithRootViewController:_userInfoViewController];
    [navigationControllers addObject:_userInfoNavigationController];
    
    self.viewControllers = navigationControllers;
}

- (void)setupTabBarItems
{
    NSArray *lpTabs =  self.viewControllers;
    
    NSMutableDictionary *tabNameDic = [[NSMutableDictionary alloc] initWithCapacity:0];
    [tabNameDic setObject:NSLocalizedStringKB(@"TBNewsTitle") forKey:[NSString stringWithFormat:@"%d", TABBAR_INDEX_NEWS]];
    [tabNameDic setObject:NSLocalizedStringKB(@"TBConvenTitle") forKey:[NSString stringWithFormat:@"%d", TABBAR_INDEX_CVNE]];
    [tabNameDic setObject:NSLocalizedStringKB(@"TBInteractTitle") forKey:[NSString stringWithFormat:@"%d", TABBAR_INDEX_INTERACT]];
    [tabNameDic setObject:NSLocalizedStringKB(@"TBUserTitle") forKey:[NSString stringWithFormat:@"%d", TABBAR_INDEX_USER]];
    
    
    NSMutableDictionary *iconNameDic = [[NSMutableDictionary alloc] initWithCapacity:0];
    [iconNameDic setObject:@"tab_icon_msg" forKey:[NSString stringWithFormat:@"%d", TABBAR_INDEX_NEWS]];
    [iconNameDic setObject:@"bar_icon_post_norm" forKey:[NSString stringWithFormat:@"%d", TABBAR_INDEX_CVNE]];
    [iconNameDic setObject:@"tab_icon_share" forKey:[NSString stringWithFormat:@"%d", TABBAR_INDEX_INTERACT]];
    [iconNameDic setObject:@"tab_icon_more" forKey:[NSString stringWithFormat:@"%d", TABBAR_INDEX_USER]];
    
    NSMutableDictionary *iconPresNameDic = [[NSMutableDictionary alloc] initWithCapacity:0];
    [iconPresNameDic setObject:@"tab_icon_msg_press" forKey:[NSString stringWithFormat:@"%d", TABBAR_INDEX_NEWS]];
    [iconPresNameDic setObject:@"bar_icon_post_pres" forKey:[NSString stringWithFormat:@"%d", TABBAR_INDEX_CVNE]];
    [iconPresNameDic setObject:@"tab_icon_share_press" forKey:[NSString stringWithFormat:@"%d", TABBAR_INDEX_INTERACT]];
    [iconPresNameDic setObject:@"tab_icon_more_press" forKey:[NSString stringWithFormat:@"%d", TABBAR_INDEX_USER]];
    
    // 设置各个导航Item的名称和图片
    for(int i = 0; i < lpTabs.count; i++) {
        UIViewController *controller = [lpTabs objectAtIndex:i];
        controller.tabBarItem.titlePositionAdjustment = UIOffsetMake(0, -1.4);
        controller.tabBarItem.tag = i;
        controller.tabBarItem.title = [tabNameDic objectForKey:[NSString stringWithFormat:@"%d", i]];
        controller.tabBarItem.image = [UIImage imageNamed:[iconNameDic objectForKey:[NSString stringWithFormat:@"%d", i]]];
        controller.tabBarItem.imageInsets = UIEdgeInsetsMake(-2.0f, 0.0f, 2.0f, 0.0f);
    }
    
    [iconPresNameDic release];
    [iconNameDic release];
    [tabNameDic release];
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
