//
//  PlayerViewController.h
//  SecretsOfDali
//
//  Created by Mikhail Provizion on 03.02.13.
//  Copyright (c) 2013 Mikhail Provizion. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "ModelController.h"


@interface PlayerViewController : UIViewController {

    IBOutlet UIButton* playButton;
    IBOutlet UISlider *timeSlider;
        
}

@property (nonatomic, retain) AVAudioPlayer *player;
@property (nonatomic, retain) PaintObject *paintObject;


- (IBAction)play: (id) sender;
- (IBAction)close:(id)sender;


@end
