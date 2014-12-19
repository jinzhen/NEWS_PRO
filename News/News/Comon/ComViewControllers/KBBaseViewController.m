//
//  KBBaseViewController.m
//  News
//
//  Created by lihaijin on 14-12-19.
//  Copyright (c) 2014年 lihaijin. All rights reserved.
//

#import "KBBaseViewController.h"

@interface KBBaseViewController ()

@end

@implementation KBBaseViewController

- (void)dealloc
{
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)setNavigationTitle:(NSString*)title
{
    UILabel* lpLabel = [[UILabel alloc] initWithFrame:CGRectMake((kScreenWidth - 150.0f) / 2.0f, 0, 150, 44)];
    lpLabel.text = title;
    lpLabel.backgroundColor=[UIColor clearColor];
    lpLabel.textAlignment = NSTextAlignmentCenter;
    lpLabel.textColor = [UIColor blackColor];
    lpLabel.font = [UIFont boldSystemFontOfSize:17];
    lpLabel.baselineAdjustment = UIBaselineAdjustmentAlignBaselines;
    self.navigationItem.titleView = lpLabel;
    [lpLabel release];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
