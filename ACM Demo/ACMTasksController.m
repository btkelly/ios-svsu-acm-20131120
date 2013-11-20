//
//  ACMTasksController.m
//  ACM Demo
//
//  Created by Brian Munzenberger on 11/1/13.
//  Copyright (c) 2013 Detroit Labs. All rights reserved.
//

#import "ACMTasksController.h"

@implementation ACMTasksController {
	NSMutableArray *_tasks;
}

- (id)init
{
	self = [super init];
	if (self) {
		_tasks = [NSMutableArray array];
	}
	return self;
}

- (NSArray *)tasks
{
	return _tasks;
}

- (void)addTask:(NSString *)task
{
	[_tasks addObject:task];
}

- (void)removeTaskAtIndex:(NSInteger)index
{
	[_tasks removeObjectAtIndex:index];
}

#pragma mark - Persistence

- (void)loadTasksFromFile:(NSString*)fileName
{
	NSString *filePath = [self pathToFile:fileName];
	
	NSMutableArray *savedTasks = [NSMutableArray arrayWithContentsOfFile:filePath];
	
	NSLog(@"Loaded %i tasks from file: %@", savedTasks.count, filePath);
	
	if (savedTasks) {
		_tasks = savedTasks;
	}
}

- (void)saveTasksToFile:(NSString*)fileName
{
	NSString *filePath = [self pathToFile:fileName];
	
	NSLog(@"Saving %i tasks to file: %@", _tasks.count, filePath);
	
	[_tasks writeToFile:filePath atomically:YES];
}

- (NSString*)pathToFile:(NSString*)fileName
{
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths firstObject];
	return [NSString stringWithFormat:@"%@/%@", documentsDirectory, fileName];
}

@end
