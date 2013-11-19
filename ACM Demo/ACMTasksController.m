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

@end
