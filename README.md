# iOS Demo App for SVSU ACM 11/20/2013

Steps used to create this application:

1. In Xcode, create a new single-view application.
2. Delete the initial view controller from the main storyboard and the default view controller header and implementation files.
3. Add a navigation controller to the main storyboard.
4. Change the title of the root view controller to "Task List".
5. Set the table view selection style to "No Selection" and editing to "No Selection During Editing".
6. Change the prototype cell style to Basic and set the Identifier to "TaskCell".
7. Create a new subclass of `UITableViewController` named `ACMTasksViewController`.
8. Assign the custom class for the table view controller in the storyboard to `ACMTasksViewController`.
9. In the storyboard, add a bar button item to the table view controller with the label "New".
10. Drop a new view controller onto the storyboard.
11. Add a push segue from the "New" button to the new view controller, set its identifier to "NewTask".
12. Edit the title of the new view controller to "New Task".
13. Add a text field to the New Task view controller and set its placeholder text to "Task name".
14. Add a button to the New Task view controller and change the label to "Save".
15. Create a new subclass of `UIViewController` named `ACMNewTaskViewController`.
16. Assign the custom class for the New Task view controller to `ACMNewTaskViewController`.
17. Create a new subclass of `NSObject` named `ACMTasksController`.
18. Implement the basics of `ACMTasksController`.
19. Declare an instance of `ACMTasksController` in the `ACMTasksViewController` and initialize it in `viewDidLoad`.
20. Implement the `UITableViewDataSource` methods in `ACMTasksViewController`.
21. Add a `ACMTasksController` property to `ACMNewTaskViewController`.
22. Implement `prepareForSegue:sender:` in `ACMTasksViewController`.
23. Add an outlet for the task name text field.
24. Add an IBAction for tapping the save button called `saveButtonTapped:`.
25. Implement the methods to swipe to delete in `ACMTasksViewController`.
26. Implement methods to persist task data to disk in `ACMTasksController`.
27. Update `viewDidLoad` in `ACMTasksViewController` to load the tasks from file.
28. Add the `UIApplicationDidEnterBackgroundNotification` notification observer and handler method to save the tasks.