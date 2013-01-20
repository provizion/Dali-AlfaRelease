//
//  DataViewController.h
//  Dali AlfaRelease
//
//  Created by Mikhail Provizion on 20.01.13.
//  Copyright (c) 2013 Mikhail Provizion. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PaintObject.h"

@interface DataViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIImageView *paintView;
@property (strong, nonatomic) PaintObject *paintObject;

@end
