//
//  A1MasterViewController.h
//  AssignmentOne
//
//  Created by Nicholas Cipollina on 4/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class A1DetailViewController;

@interface A1MasterViewController : UIViewController
- (IBAction)viewTimes:(id)sender;

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@property (nonatomic, copy) NSArray *eventsArray;
@property (nonatomic, strong) A1DetailViewController *detailController;

@end
