//
//  ButtonsViewController.m
//  Dali AlfaRelease
//
//  Created by Mikhail Provizion on 20.01.13.
//  Copyright (c) 2013 Mikhail Provizion. All rights reserved.
//

#import "ButtonsViewController.h"

@interface ButtonsViewController ()

@end

@implementation ButtonsViewController

@synthesize titleLabel, paintObject, player, text;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (void) viewWillAppear:(BOOL)animated
{
    titleLabel.text = paintObject.name;
    text.text = paintObject.text;
    player = [[AVAudioPlayer alloc] initWithContentsOfURL:paintObject.voice error:nil];
    [player prepareToPlay];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (IBAction)songPlay:(id)sender

{
        if (self.player.isPlaying == NO)
        {
            [player play];
            UIImage *pauseButtonImage = [UIImage imageNamed:@"pauseButton.png"];
            [playButton setImage:pauseButtonImage forState:UIControlStateNormal];
        }
        
        else
        {
            [player stop];
            UIImage *playButtonImage = [UIImage imageNamed:@"playButton.png"];
            [playButton setImage:playButtonImage forState:UIControlStateNormal];
        }

}

- (IBAction) hideButton:(id)sender

{
    
    if (self.titleLabel.alpha == 1)
    {
        self.titleLabel.alpha = 0;
        playButton.alpha = 0;
        labelAboveButtons.alpha = 0;
        bottomArc.alpha = 0;
        upperArc.alpha = 0;
        labelVoiceButton.alpha = 0;
        text.alpha = 0;
        
    
    }
    else
    {
        self.titleLabel.alpha = 1;
        playButton.alpha = 1;
        labelAboveButtons.alpha = 1;
        bottomArc.alpha = 1;
        upperArc.alpha = 1;
        labelVoiceButton.alpha = 1;
        text.alpha = 1;
    }
}


@end
