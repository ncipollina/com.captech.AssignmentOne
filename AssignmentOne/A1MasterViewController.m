//
//  A1MasterViewController.m
//  AssignmentOne
//
//  Created by Nicholas Cipollina on 4/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "A1MasterViewController.h"
#import "Event.h"


@interface A1MasterViewController ()

@end

@implementation A1MasterViewController
@synthesize eventsArray = _eventsArray;
@synthesize managedObjectContext = _managedObjectContext;
@synthesize detailController = _detailController;

- (void)dealloc{
    [_eventsArray release];
    [_managedObjectContext release];
    [_detailController release];
    [super dealloc];
}

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
    [self insertNewObject];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Event" inManagedObjectContext:self.managedObjectContext];
    
    [request setEntity:entity];
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"timeStamp" ascending:YES];
    NSArray *sortDescriptors = [[NSArray alloc] initWithObjects:sortDescriptor, nil];
    [request setSortDescriptors:sortDescriptors];
    
    NSError *error = nil;
    NSArray *fetchResults = [self.managedObjectContext executeFetchRequest:request error:&error];
    
    if (fetchResults == nil){
        // Handle the error
    }
    
    [self setEventsArray:fetchResults];
  
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)insertNewObject
{    
    if (self.managedObjectContext == nil)
        NSLog(@"Wah wah wah wah wah");
    
    Event *event = (Event *)[NSEntityDescription insertNewObjectForEntityForName:@"Event" inManagedObjectContext:self.managedObjectContext];  
    
    [event setTimeStamp:[NSDate date]];
    // Save the context.
    NSError *error = nil;
    if (![self.managedObjectContext save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. 
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
}

- (IBAction)viewTimes:(id)sender {
    if (self.detailController == nil){
        self.detailController = [[[A1DetailViewController alloc] initWithNibName:@"A1DetailViewController" bundle:[NSBundle mainBundle]] autorelease];
    }
    [self.detailController setEventsArray:self.eventsArray];
    [self.navigationController pushViewController:self.detailController animated:YES];
}
@end
