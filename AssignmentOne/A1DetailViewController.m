//
//  A1DetailViewController.m
//  AssignmentOne
//
//  Created by Nicholas Cipollina on 4/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "A1DetailViewController.h"

#import "Event.h"

@interface A1DetailViewController ()
- (void)configureView;
@end

@implementation A1DetailViewController

@synthesize eventsArray = _eventsArray;

#pragma mark - Managing the detail item

- (void)setEventsArray:(NSArray *)newArray{
    if (_eventsArray != newArray) {
        _eventsArray = newArray;
        
        [self configureView];
    }
}


- (void)configureView
{
    // Update the user interface for the detail item.

    [self.tableView reloadData];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.eventsArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    [self configureCell:cell atIndexPath:indexPath];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}


- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // The table view should not be re-orderable.
    return NO;
}

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
    // A date formatter for the time stamp.
    static NSDateFormatter *dateFormatter = nil;
    
    if (dateFormatter == nil){
        dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setTimeStyle:NSDateFormatterMediumStyle];
        [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
        [dateFormatter setLocale:[NSLocale currentLocale]];
    }

    Event *event = (Event *)[self.eventsArray objectAtIndex:indexPath.row];
    cell.textLabel.text = [dateFormatter stringFromDate:[event timeStamp]];
}

@end
