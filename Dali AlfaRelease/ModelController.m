//
//  ModelController.m
//  Dali AlfaRelease
//
//  Created by Mikhail Provizion on 20.01.13.
//  Copyright (c) 2013 Mikhail Provizion. All rights reserved.
//

#import "ModelController.h"
#import "DataViewController.h"
#

/*
 A controller object that manages a simple model -- a collection of month names.
 
 The controller serves as the data source for the page view controller; it therefore implements pageViewController:viewControllerBeforeViewController: and pageViewController:viewControllerAfterViewController:.
 It also implements a custom method, viewControllerAtIndex: which is useful in the implementation of the data source methods, and in the initial configuration of the application.
 
 There is no need to actually create view controllers for each page in advance -- indeed doing so incurs unnecessary overhead. Given the data model, these methods create, configure, and return a new view controller on demand.
 */

@interface ModelController()
@end

@implementation ModelController
@synthesize pageData;

- (id)init
{
    self = [super init];
    if (self) {
        // Create the data model.
        [self createData];
    }
    return self;
}

- (DataViewController *)viewControllerAtIndex:(NSUInteger)index storyboard:(UIStoryboard *)storyboard
{   
    // Return the data view controller for the given index.
    if (([self.pageData count] == 0) || (index >= [self.pageData count])) {
        return nil;
    }
    // Create a new view controller and pass suitable data.
    DataViewController *dataViewController = [storyboard instantiateViewControllerWithIdentifier:@"DataViewController"];
      dataViewController.paintObject = [self.pageData objectAtIndex:index] ;
    return dataViewController;
}

- (NSUInteger)indexOfViewController:(DataViewController *)viewController
{   
     // Return the index of the given data view controller.
     // For simplicity, this implementation uses a static array of model objects and the view controller stores the model object; you can therefore use the model object to identify the index.
    return [self.pageData indexOfObject:viewController.paintObject];
}

#pragma mark - Create Data

- (void) createData
{
      NSString *modelData = [[NSBundle mainBundle] pathForResource: @"ModelData" ofType: @"plist"];
      NSMutableDictionary *modelDataDict = [[NSMutableDictionary alloc] initWithContentsOfFile:modelData];
      
      //initiate the array of paintobjects
      
      self.pageData = [NSMutableArray arrayWithCapacity:[modelDataDict count]];
      for (int i = 0; i < [modelDataDict count]; i++)
      {
            NSString* key = [NSString stringWithFormat:@"%d", i];
            
            PaintObject *p = [[PaintObject alloc] init];
            p.name = [[modelDataDict valueForKey:key] valueForKey:@"name"];
            NSString *soundFilePath = [[NSBundle mainBundle] pathForResource: [[modelDataDict valueForKey:key] valueForKey:@"voice"] ofType: @"mp3"];
            p.voice = [[NSURL alloc] initFileURLWithPath:soundFilePath];
            p.text = [[modelDataDict valueForKey:key] valueForKey:@"text"];
            UIImage *paintImage = [UIImage imageNamed:[[modelDataDict valueForKey:key] valueForKey:@"image"]];
            p.image = paintImage;
            
            [self.pageData addObject:p];
      }
}

#pragma mark - Page View Controller Data Source

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = [self indexOfViewController:(DataViewController *)viewController];
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    index--;
    return [self viewControllerAtIndex:index storyboard:viewController.storyboard];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = [self indexOfViewController:(DataViewController *)viewController];
    if (index == NSNotFound) {
        return nil;
    }
    
    index++;
    if (index == [self.pageData count]) {
        return nil;
    }
    return [self viewControllerAtIndex:index storyboard:viewController.storyboard];
}



@end
