//
//  PlayerViewController.m
//  SecretsOfDali
//
//  Created by Mikhail Provizion on 03.02.13.
//  Copyright (c) 2013 Mikhail Provizion. All rights reserved.
//

#import "PlayerViewController.h"

@interface PlayerViewController ()

@end

@implementation PlayerViewController

@synthesize paintObject, player;

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
    NSURL *urlForPlayer = paintObject.voice;
    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:urlForPlayer error:nil];
    [player prepareToPlay];
    

}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewDidLoad];
    NSURL *urlForPlayer = paintObject.voice;
    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:urlForPlayer error:nil];
    [player prepareToPlay];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)play:(id)sender

{
    if (self.player.isPlaying == NO)
        [player play];
    else
        [player pause];
    
}

- (IBAction)close:(id)sender
{
    [self.view removeFromSuperview];
}



@end
