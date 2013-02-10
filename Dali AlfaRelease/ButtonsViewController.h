//
//  ButtonsViewController.h
//  Dali AlfaRelease
//
//  Created by Mikhail Provizion on 20.01.13.
//  Copyright (c) 2013 Mikhail Provizion. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PaintObject.h"
#import <AVFoundation/AVFoundation.h>



@interface ButtonsViewController : UIViewController <AVAudioPlayerDelegate> {
    
    IBOutlet UIButton *playButton;
    IBOutlet UILabel *labelAboveButtons;
    IBOutlet UILabel *labelVoiceButton;
    IBOutlet UIImageView *bottomArc;
    IBOutlet UIImageView *upperArc;
    UIImageView *highlightImageView;
    
}

@property (nonatomic, retain) IBOutlet UILabel *titleLabel;
@property (nonatomic, retain) PaintObject *paintObject;
@property (nonatomic, retain) AVAudioPlayer *myplayer;
@property (nonatomic, retain) IBOutlet UITextView *text;


- (IBAction)songPlay:(id)sender;
- (IBAction)hideButton:(id)sender;

- (void) setPlayButton;
- (void) highlightWithImage: (NSString*) imageString forPeriod: (NSTimeInterval*) period;

@end


