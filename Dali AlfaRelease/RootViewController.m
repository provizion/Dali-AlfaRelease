//
//  RootViewController.m
//  Dali AlfaRelease
//
//  Created by Mikhail Provizion on 20.01.13.
//  Copyright (c) 2013 Mikhail Provizion. All rights reserved.
//

#import "RootViewController.h"
#import "ModelController.h"
#import "ButtonsViewController.h"
#import "DataViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface RootViewController ()
@property (readonly, strong, nonatomic) ModelController *modelController;
@property (strong, nonatomic) ButtonsViewController *buttonsViewController;
@property (strong, nonatomic) InfoViewController *infoViewController;
@property (strong, nonatomic) PlayerViewController *playerViewController;
@end

@implementation RootViewController

@synthesize modelController = _modelController;
@synthesize pageViewController, buttonsViewController, currentIndex;

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    
    // Configure the page view controller and add it as a child view controller.
    self.pageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStylePageCurl navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    
    

    DataViewController *startingViewController = [self.modelController viewControllerAtIndex:0 storyboard:self.storyboard];
    NSArray *viewControllers = @[startingViewController];
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:NULL];

    self.pageViewController.dataSource = self.modelController;
    self.pageViewController.delegate = self;

    [self addChildViewController:self.pageViewController];
    [self.view addSubview:self.pageViewController.view];

    // Set the page view controller's bounds using an inset rect so that self's view is visible around the edges of the pages.
    CGRect pageViewRect = self.view.bounds;
    pageViewRect = CGRectInset(pageViewRect, 0, 0);
    self.pageViewController.view.frame = pageViewRect;

    [self.pageViewController didMoveToParentViewController:self];
    
    // Configure ButtonsViewController
    
    self.buttonsViewController = [[ButtonsViewController alloc] initWithNibName:@"ButtonsViewController" bundle:nil];
    self.buttonsViewController.delegate = self;
    [self addChildViewController:self.buttonsViewController];
    self.buttonsViewController.paintObject = [self.modelController.pageData objectAtIndex:currentIndex];
    [self.view addSubview:self.buttonsViewController.view];
    self.buttonsViewController.view.frame = pageViewRect;
    
    // Configure InfoViewController
    
    self.infoViewController = [[InfoViewController alloc] initWithNibName:@"InfoViewController" bundle:nil];
    
    //Configure PlayerViewController
    
    self.playerViewController = [[PlayerViewController alloc] initWithNibName:@"PlayerViewController" bundle:nil];
    self.playerViewController.paintObject = [self.modelController.pageData objectAtIndex:currentIndex];
    
    
    // Add the page view controller's gesture recognizers to the book view controller's view so that the gestures are started more easily.
    
    self.view.gestureRecognizers = self.pageViewController.gestureRecognizers;
    
    //Override the TapGestureRecognizer
    
    // Find the tap gesture recognizer so we can remove it!
    UIGestureRecognizer* tapRecognizer = nil;
    for (UIGestureRecognizer* recognizer in self.pageViewController.gestureRecognizers) {
        if ( [recognizer isKindOfClass:[UITapGestureRecognizer class]] ) {
            tapRecognizer = recognizer;
            break;
        }
    }
    
    if ( tapRecognizer ) {
        [self.view removeGestureRecognizer:tapRecognizer];
        [self.pageViewController.view removeGestureRecognizer:tapRecognizer];
    }
        
        
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (ModelController *)modelController
{
     // Return the model controller object, creating it if necessary.
     // In more complex implementations, the model controller may be passed to the view controller.
    if (!_modelController) {
        _modelController = [[ModelController alloc] init];
    }
    return _modelController;
}

#pragma mark - ButtonsViewController delegate methods


- (void) showInfoView
{
    self.infoViewController.paintObject = [self.modelController.pageData objectAtIndex:currentIndex];
    [self.view addSubview:self.infoViewController.view];

}

#pragma mark - Info&AudioViewControllers delegate methods

- (void) closeInfoView

{
    [self.infoViewController.view removeFromSuperview];
   

}

- (void) voicePressed

{
    
    self.playerViewController.paintObject = [self.modelController.pageData objectAtIndex:currentIndex];
    [self.view addSubview:self.playerViewController.view];
    
    
}

#pragma mark - UIPageViewController delegate methods

- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray *)previousViewControllers transitionCompleted:(BOOL)completed
{
    if (completed == YES);
    {
        currentIndex = [self.modelController indexOfViewController:[self.pageViewController.viewControllers objectAtIndex:0]];
        NSLog (@"CurrentPage = %i",currentIndex);
    
        PaintObject *currentPaintObject = [[PaintObject alloc] init];
        currentPaintObject = [self.modelController.pageData objectAtIndex:currentIndex];
        self.buttonsViewController.titleLabel.text = currentPaintObject.name;
        self.infoViewController.textView.text = currentPaintObject.text;
        NSURL *urlForPlayer = currentPaintObject.voice;
        self.playerViewController.player = [[AVAudioPlayer alloc] initWithContentsOfURL:urlForPlayer error:nil];
        [self.playerViewController.player prepareToPlay];
        
    }
    
}


@end




/*




- (UIPageViewControllerSpineLocation)pageViewController:(UIPageViewController *)pageViewController spineLocationForInterfaceOrientation:(UIInterfaceOrientation)orientation
{
    if (UIInterfaceOrientationIsPortrait(orientation)) {
        // In portrait orientation: Set the spine position to "min" and the page view controller's view controllers array to contain just one view controller. Setting the spine position to 'UIPageViewControllerSpineLocationMid' in landscape orientation sets the doubleSided property to YES, so set it to NO here.
        UIViewController *currentViewController = self.pageViewController.viewControllers[0];
        NSArray *viewControllers = @[currentViewController];
        [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:NULL];
        
        self.pageViewController.doubleSided = NO;
        return UIPageViewControllerSpineLocationMin;
    }

    // In landscape orientation: Set set the spine location to "mid" and the page view controller's view controllers array to contain two view controllers. If the current page is even, set it to contain the current and next view controllers; if it is odd, set the array to contain the previous and current view controllers.
    DataViewController *currentViewController = self.pageViewController.viewControllers[0];
    NSArray *viewControllers = nil;

    NSUInteger indexOfCurrentViewController = [self.modelController indexOfViewController:currentViewController];
    if (indexOfCurrentViewController == 0 || indexOfCurrentViewController % 2 == 0) {
        UIViewController *nextViewController = [self.modelController pageViewController:self.pageViewController viewControllerAfterViewController:currentViewController];
        viewControllers = @[currentViewController, nextViewController];
    } else {
        UIViewController *previousViewController = [self.modelController pageViewController:self.pageViewController viewControllerBeforeViewController:currentViewController];
        viewControllers = @[previousViewController, currentViewController];
    }
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:NULL];


    return UIPageViewControllerSpineLocationMid;
}
 */

/*
 - (void) nextButtonPressed
 {
 DataViewController *nextDataViewController = [[DataViewController alloc] init];
 PaintObject *paintObjectForAudio = [[PaintObject alloc] init];
 NSUInteger index = [self.modelController indexOfViewController:[self.pageViewController.viewControllers objectAtIndex:0]];
 index ++;
 if (index < [self.modelController.pageData count]) {
 
 nextDataViewController = [self.modelController viewControllerAtIndex:index storyboard:self.storyboard];
 NSArray *viewControllers = @[nextDataViewController];
 [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:NULL];
 
 currentIndex = [self.modelController indexOfViewController:[self.pageViewController.viewControllers objectAtIndex:0]];
 
 //add the voice for next scene
 paintObjectForAudio = [self.modelController.pageData objectAtIndex:index];
 
 //change the title and text
 
 self.buttonsViewController.titleLabel.text = paintObjectForAudio.name;
 
 }
 
 
 }
 
 - (void) previousButtonPressed
 {
 DataViewController *nextDataViewController = [[DataViewController alloc] init];
 PaintObject *paintObjectForAudio = [[PaintObject alloc] init];
 NSUInteger index = [self.modelController indexOfViewController:[self.pageViewController.viewControllers objectAtIndex:0]];
 if ((index == 0) || (index == NSNotFound)) {
 
 }
 
 else {
 index --;
 
 
 nextDataViewController = [self.modelController viewControllerAtIndex:index storyboard:self.storyboard];
 NSArray *viewControllers = @[nextDataViewController];
 [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionReverse animated:YES completion:NULL];
 
 //load the audio for paint
 currentIndex = [self.modelController indexOfViewController:[self.pageViewController.viewControllers objectAtIndex:0]];
 
 paintObjectForAudio = [self.modelController.pageData objectAtIndex:index];
 
 //change the title and text
 
 self.buttonsViewController.titleLabel.text = paintObjectForAudio.name;
 NSLog (@"%i", currentIndex);
 
 }
 }
 */



