//
//  InfoViewController.h
//  Dali AlfaRelease
//
//  Created by Mikhail Provizion on 20.01.13.
//  Copyright (c) 2013 Mikhail Provizion. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PaintObject.h"

@protocol InfoViewControllerDelegate;

@interface InfoViewController : UIViewController

- (IBAction)done:(id)sender;

@property (nonatomic, retain) id <InfoViewControllerDelegate> delegate;
@property PaintObject *paintObject;
@property UITextView *infoView;
@property IBOutlet UITextView *textView;

@end

@protocol InfoViewControllerDelegate

- (void) closeInfoView;

@end

