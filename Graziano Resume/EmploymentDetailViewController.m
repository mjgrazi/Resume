//
//  EmploymentDetailViewController.m
//  Graziano Resume
//
//  Created by Mike Graziano on 2/5/13.
//  Copyright (c) 2013 Mike Graziano. All rights reserved.
//

#import "EmploymentDetailViewController.h"
#import "ResponsibilitiesCell.h"
#import "Job.h"

@interface EmploymentDetailViewController ()

@property (strong, nonatomic) NSMutableArray *responsibilitiesArray;

@end

@implementation EmploymentDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[self positionLabel] setText:[self.theJob valueForKey:@"Title"]];
    [[self yearsLabel] setText:[self.theJob valueForKey:@"Dates"]];
    [self setTitle:[self.theJob valueForKey:@"Name"]];
    UIImage *logoFromFile = [UIImage imageNamed: [self.theJob valueForKey:@"Image"]];
    [self.companyLogo setImage:logoFromFile];
    NSMutableArray *resp = (NSMutableArray *)[self.theJob valueForKey:@"Responsibilities"];
    [self setResponsibilitiesArray:resp];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark UITableViewDelegate methods

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ResponsibilitiesCell *cell = (ResponsibilitiesCell*)[tableView dequeueReusableCellWithIdentifier:@"responsibilitiesCell"];
    if (cell == nil) {
        cell = [[ResponsibilitiesCell alloc] init];
    }
    [cell.respLabel setText:[self.responsibilitiesArray objectAtIndex:indexPath.row]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self getHeightOfLabel:[self.responsibilitiesArray objectAtIndex:indexPath.row] ofFontSize:12 withConstraint:CGSizeMake(280, 9999)] + 8;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.responsibilitiesArray count];
}

- (CGFloat) getHeightOfLabel:(NSString *)text ofFontSize:(CGFloat)fontSize withConstraint:(CGSize)constraint
{
    CGSize size = [text sizeWithFont:[UIFont systemFontOfSize:fontSize] constrainedToSize:constraint];
    return size.height;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] init];
    return view;
}

@end
