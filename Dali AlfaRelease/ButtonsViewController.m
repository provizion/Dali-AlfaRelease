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

@synthesize delegate, titleLabel, paintObject;

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)nextPaintingShow:(id)sender

{
    [delegate nextButtonPressed];
}

- (IBAction)previousPaintingShow:(id)sender

{
    
    [delegate previousButtonPressed];
}

- (IBAction)infoShow:(id)sender

{
    [delegate showInfoView];
}

- (IBAction)songPlay:(id)sender

{
    [delegate voicePressed];
}

- (IBAction) hideButton:(id)sender

{
    
    if (self.titleLabel.alpha == 1)
    {
        self.titleLabel.alpha = 0;
        playButton.alpha = 0;
        infoButton.alpha = 0;
        labelAboveButtons.alpha = 0;
        bottomArc.alpha = 0;
        upperArc.alpha = 0;
        labelTextButton.alpha = 0;
        labelVoiceButton.alpha = 0;
        
    
    }
    else
    {
        self.titleLabel.alpha = 1;
        playButton.alpha = 1;
        infoButton.alpha = 1;
        labelAboveButtons.alpha = 1;
        bottomArc.alpha = 1;
        upperArc.alpha = 1;
        labelTextButton.alpha = 1;
        labelVoiceButton.alpha = 1;
    }
    

}


@end
