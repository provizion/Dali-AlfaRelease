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

@synthesize titleLabel, paintObject, myplayer, text;

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
    myplayer = [[AVAudioPlayer alloc] initWithContentsOfURL:paintObject.voice error:nil];
    self.myplayer.delegate = self;
    [myplayer prepareToPlay];
    
         
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (IBAction)songPlay:(id)sender

{
    if (self.myplayer.isPlaying == NO)
    {
        [myplayer play];
        UIImage *pauseButtonImage = [UIImage imageNamed:@"pauseButton.png"];
        [playButton setImage:pauseButtonImage forState:UIControlStateNormal];
        
        [UIView animateWithDuration:0.5
                              delay:1
                            options:UIViewAnimationOptionTransitionFlipFromBottom
                         animations:^{titleLabel.alpha = 0;
                             playButton.alpha = 0;
                             labelAboveButtons.alpha = 0;
                             bottomArc.alpha = 0;
                             upperArc.alpha = 0;
                             labelVoiceButton.alpha = 0;
                             text.alpha = 0;}
         
                         completion:nil];
        
    }
    
    else
    {
        [myplayer stop];
        UIImage *playButtonImage = [UIImage imageNamed:@"playButton.png"];
        [playButton setImage:playButtonImage forState:UIControlStateNormal];
    }

}

- (IBAction) hideButton:(id)sender

{
    
    if (self.titleLabel.alpha == 1)
    {
        [UIView animateWithDuration:0.4
                              delay:0.1
                            options:UIViewAnimationOptionTransitionFlipFromBottom
                         animations:^{titleLabel.alpha = 0;
         playButton.alpha = 0;
         labelAboveButtons.alpha = 0;
         bottomArc.alpha = 0;
         upperArc.alpha = 0;
         labelVoiceButton.alpha = 0;
                             text.alpha = 0;}
         
        completion:nil];
        
    
    }
    else
    {
        [UIView animateWithDuration:0.2
                              delay:0.0
                            options:UIViewAnimationOptionTransitionFlipFromBottom
                         animations:^{titleLabel.alpha = 1;
                             playButton.alpha = 1;
                             labelAboveButtons.alpha = 1;
                             bottomArc.alpha = 1;
                             upperArc.alpha = 1;
                             labelVoiceButton.alpha = 1;
                             text.alpha = 1;}
         
                         completion:nil];

    }
}

- (void) setPlayButton;

{
    if (self.myplayer.isPlaying == NO)
    {
        UIImage *playButtonImage = [UIImage imageNamed:@"playButton.png"];
        [playButton setImage:playButtonImage forState:UIControlStateNormal];
        
    }
    
    else
    {
        UIImage *pauseButtonImage = [UIImage imageNamed:@"pauseButton.png"];
        [playButton setImage:pauseButtonImage forState:UIControlStateNormal];
    }

}

- (void) audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag

{
    [UIView animateWithDuration:0.2
                          delay:0.0
                        options:UIViewAnimationOptionTransitionFlipFromBottom
                     animations:^{titleLabel.alpha = 1;
                         playButton.alpha = 1;
                         labelAboveButtons.alpha = 1;
                         bottomArc.alpha = 1;
                         upperArc.alpha = 1;
                         labelVoiceButton.alpha = 1;
                         text.alpha = 1;}
     
                     completion:nil];
    [player stop];
    [self setPlayButton];

}

- (void) highlightWithImage: (NSString*) imageString forPeriod: (NSTimeInterval*) period;

{
    UIImage *image = [UIImage imageNamed:imageString];
    highlightImageView.image = image;
    highlightImageView.frame = self.view.frame;
    [self.view addSubview:highlightImageView];
    [NSTimer timerWithTimeInterval:*period target:self selector:@selector(removeFromSuperViewOnTimer)  userInfo:nil repeats:NO];
}

- (void) removeFromSuperViewOnTimer;
{
    [highlightImageView removeFromSuperview];
}

@end
