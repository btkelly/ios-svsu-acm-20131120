//
//  ACMTasksController.h
//  ACM Demo
//
//  Created by Brian Munzenberger on 11/1/13.
//  Copyright (c) 2013 Detroit Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ACMTasksController : NSObject

@property (readonly) NSArray *tasks;

- (void)addTask:(NSString*)task;
- (void)removeTaskAtIndex:(NSInteger)index;

- (void)loadTasksFromFile:(NSString*)fileName;
- (void)saveTasksToFile:(NSString*)fileName;

@end
