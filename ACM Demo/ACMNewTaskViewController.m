//
//  ACMNewTaskViewController.m
//  ACM Demo
//
//  Created by Brian Munzenberger on 11/1/13.
//  Copyright (c) 2013 Detroit Labs. All rights reserved.
//

#import "ACMNewTaskViewController.h"

#import "ACMTasksController.h"

@interface ACMNewTaskViewController ()

@property (strong, nonatomic) IBOutlet UITextField *taskTextField;

@end

@implementation ACMNewTaskViewController

- (IBAction)saveButtonTapped:(id)sender
{
	NSString *task = self.taskTextField.text;
	
	if ([task isEqualToString:@""]) {
		[[[UIAlertView alloc] initWithTitle:@"Error"
									message:@"Please enter a task"
								   delegate:Nil
						  cancelButtonTitle:@"OK"
						  otherButtonTitles:nil] show];
	}
	else {
		[self.tasksController addTask:self.taskTextField.text];
		
		[self.navigationController popViewControllerAnimated:YES];
	}
}

@end
