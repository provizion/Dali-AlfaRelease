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

@synthesize nextButton, previousButton, infoButton, delegate;

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
    // Do any additional setup after loading the view from its nib.
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

- (IBAction)previousPaintingShow:(id)sender;

{
    
    [delegate previousButtonPressed];
}

@end