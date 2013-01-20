//
//  ButtonsViewController.h
//  Dali AlfaRelease
//
//  Created by Mikhail Provizion on 20.01.13.
//  Copyright (c) 2013 Mikhail Provizion. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ButtonsViewControllerDelegate;

@interface ButtonsViewController : UIViewController {
    
    id <ButtonsViewControllerDelegate> delegate;
    
}

@property IBOutlet UIButton *previousButton;
@property IBOutlet UIButton *nextButton;
@property IBOutlet UIButton *infoButton;
@property (nonatomic, retain) id <ButtonsViewControllerDelegate> delegate;

- (IBAction)nextPaintingShow:(id)sender;



@end

@protocol ButtonsViewControllerDelegate

- (void) nextButtonPressed;

@end

