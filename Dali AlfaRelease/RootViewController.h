//
//  RootViewController.h
//  Dali AlfaRelease
//
//  Created by Mikhail Provizion on 20.01.13.
//  Copyright (c) 2013 Mikhail Provizion. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ButtonsViewController.h"

@interface RootViewController : UIViewController <UIPageViewControllerDelegate, ButtonsViewControllerDelegate>

@property (strong, nonatomic) UIPageViewController *pageViewController;
- (void) nextButtonPressed;

@end
