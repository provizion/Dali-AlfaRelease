//
//  InfoViewController.h
//  Dali AlfaRelease
//
//  Created by Mikhail Provizion on 20.01.13.
//  Copyright (c) 2013 Mikhail Provizion. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PaintObject.h"
#import <QuartzCore/QuartzCore.h>

@interface InfoViewController : UIViewController

- (IBAction)done:(id)sender;

@property PaintObject *paintObject;
@property IBOutlet UITextView *textView;
@property IBOutlet UIButton *doneButton;

@end

