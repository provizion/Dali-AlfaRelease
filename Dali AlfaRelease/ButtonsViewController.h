//
//  ButtonsViewController.h
//  Dali AlfaRelease
//
//  Created by Mikhail Provizion on 20.01.13.
//  Copyright (c) 2013 Mikhail Provizion. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PaintObject.h"

@protocol ButtonsViewControllerDelegate;


@interface ButtonsViewController : UIViewController {
    
    id <ButtonsViewControllerDelegate> delegate;
    IBOutlet UILabel *titleLabel;
    IBOutlet UIButton *playButton;
    IBOutlet UIButton *infoButton;
    
}

@property (nonatomic, retain) id <ButtonsViewControllerDelegate> delegate;
@property (nonatomic, retain) IBOutlet UILabel *titleLabel;
@property (nonatomic, retain) PaintObject *paintObject;

- (IBAction)songPlay:(id)sender;
- (IBAction)nextPaintingShow:(id)sender;
- (IBAction)previousPaintingShow:(id)sender;
- (IBAction)infoShow:(id)sender;
- (IBAction)hideButton:(id)sender;



@end

@protocol ButtonsViewControllerDelegate

- (void) nextButtonPressed;
- (void) previousButtonPressed;
- (void) showInfoView;
- (void) voicePressed;

@end

