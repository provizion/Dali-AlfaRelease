//
//  InfoViewController.m
//  Dali AlfaRelease
//
//  Created by Mikhail Provizion on 20.01.13.
//  Copyright (c) 2013 Mikhail Provizion. All rights reserved.
//

#import "InfoViewController.h"

@interface InfoViewController ()

@end

@implementation InfoViewController

@synthesize paintObject, textView, doneButton;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.

}

- (void) viewWillAppear:(BOOL)animated
{
    textView.text = paintObject.text;
}

- (IBAction)done:(id)sender
{
    [self.view removeFromSuperview];
}

@end
