//
//  DetailViewController.h
//  News
//
//  Created by lihaijin on 14-12-12.
//  Copyright (c) 2014年 lihaijin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

