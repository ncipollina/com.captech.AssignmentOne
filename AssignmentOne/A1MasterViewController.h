//
//  A1MasterViewController.h
//  AssignmentOne
//
//  Created by Nicholas Cipollina on 4/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <CoreData/CoreData.h>

@interface A1MasterViewController : UIViewController

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@property (nonatomic, copy) NSArray *eventsArray;

@end
