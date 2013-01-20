//
//  RootViewController.h
//  Dali AlfaRelease
//
//  Created by Mikhail Provizion on 20.01.13.
//  Copyright (c) 2013 Mikhail Provizion. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ButtonsViewController.h"
#import "InfoViewController.h"

@interface RootViewController : UIViewController <UIPageViewControllerDelegate, ButtonsViewControllerDelegate, InfoViewControllerDelegate>

@property (strong, nonatomic) UIPageViewController *pageViewController;

- (void) nextButtonPressed;
- (void) closeInfoView;

@end
