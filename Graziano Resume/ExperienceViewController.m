//
//  SecondViewController.m
//  Graziano Resume
//
//  Created by Mike Graziano on 2/3/13.
//  Copyright (c) 2013 Mike Graziano. All rights reserved.
//

#import "ExperienceViewController.h"
#import "EmploymentDetailViewController.h"
#import "EmploymentCell.h"
#import "Job.h"
#import "DataHandler.h"

@interface ExperienceViewController ()

@property (nonatomic, strong) Job *jobToPass;

@end

@implementation ExperienceViewController

@synthesize jobsTableView;
@synthesize jobsArray;


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setJobsArray:[[DataHandler publicDataHandler] getResumeDataForKey:@"Jobs"]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark UITableView methods

- (void)tableView:(UITableView *)tableview willDisplayCell:(EmploymentCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIColor *color = ((indexPath.row % 2) == 0) ? [UIColor clearColor] : [UIColor colorWithRed: 215.0/255.0 green: 215.0/255.0 blue: 215.0/255.0 alpha:1];
    cell.backgroundColor = color;
    tableview.separatorColor = [[UIColor alloc] initWithRed:0 green:0 blue:0 alpha:0.5];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{    
    EmploymentCell *cell = (EmploymentCell*)[tableView dequeueReusableCellWithIdentifier:@"employmentCell"];
    
    if (cell == nil) {
        cell = [[EmploymentCell alloc] init];
    }
    
    NSDictionary *section = [self.jobsArray objectAtIndex:indexPath.row];
    
    [cell setRowNumber:indexPath.row];
    [cell.companyLabel setText:[section objectForKey:@"Name"]];
    [cell.positionLabel setText:[section objectForKey:@"Title"]];
    [cell.yearsLabel setText:[section objectForKey:@"Dates"]];
        
    return cell;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return jobsArray.count;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"employmentDetailSegue"]) {
        EmploymentDetailViewController *detailViewController = (EmploymentDetailViewController *)segue.destinationViewController;
        detailViewController.theJob = [[self jobsArray] objectAtIndex:[jobsTableView indexPathForSelectedRow].row];
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] init];
    return view;
}

@end
