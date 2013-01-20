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

@property (nonatomic, retain) id <ButtonsViewControllerDelegate> delegate;

- (IBAction)nextPaintingShow:(id)sender;
- (IBAction)previousPaintingShow:(id)sender;
- (IBAction)infoShow:(id)sender;



@end

@protocol ButtonsViewControllerDelegate

- (void) nextButtonPressed;
- (void) previousButtonPressed;
- (void) showInfoView;

@end

