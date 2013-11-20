//
//  ACMTasksViewController.m
//  ACM Demo
//
//  Created by Brian Munzenberger on 11/1/13.
//  Copyright (c) 2013 Detroit Labs. All rights reserved.
//

#import "ACMTasksViewController.h"

#import "ACMNewTaskViewController.h"
#import "ACMTasksController.h"

static NSString * kACMTasksDataFile = @"tasks.data";

@interface ACMTasksViewController ()

@end

@implementation ACMTasksViewController {
	ACMTasksController *_tasksController;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	_tasksController = [[ACMTasksController alloc] init];
	
	[_tasksController loadTasksFromFile:kACMTasksDataFile];
	
	[[NSNotificationCenter defaultCenter] addObserver:self
											 selector:@selector(saveTasks)
												 name:UIApplicationDidEnterBackgroundNotification
											   object:nil];
}

- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	
	[self.tableView reloadData];
}

- (void)dealloc
{
	[[NSNotificationCenter defaultCenter] removeObserver:self
													name:UIApplicationDidEnterBackgroundNotification
												  object:nil];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return _tasksController.tasks.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"TaskCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
	cell.textLabel.text = _tasksController.tasks[indexPath.row];
    
    return cell;
}

#pragma mark - Storyboard seque

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
	if ([segue.identifier isEqualToString:@"NewTask"]) {
		
		if ([segue.destinationViewController isKindOfClass:[ACMNewTaskViewController class]]) {
			[segue.destinationViewController setTasksController:_tasksController];
		}
	}
}

#pragma mark - Swipe to delete

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
	return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
	if (editingStyle == UITableViewCellEditingStyleDelete) {
		[_tasksController removeTaskAtIndex:indexPath.row];
		[self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
	}
}

#pragma mark -

- (void)saveTasks
{
	[_tasksController saveTasksToFile:kACMTasksDataFile];
}

@end
