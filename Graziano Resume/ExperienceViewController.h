//
//  SecondViewController.h
//  Graziano Resume
//
//  Created by Mike Graziano on 2/3/13.
//  Copyright (c) 2013 Mike Graziano. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EmploymentDataSource;

@interface ExperienceViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource>
{
    IBOutlet UITableView *jobsTableView;
    NSMutableArray *jobsArray;
}

@property (strong, nonatomic) EmploymentDataSource *employmentDataSource;

@property (strong, nonatomic) IBOutlet UITableView *jobsTableView;
@property (strong, nonatomic) NSArray *jobsArray;
@property (strong, nonatomic) NSArray *jobs;

@end
