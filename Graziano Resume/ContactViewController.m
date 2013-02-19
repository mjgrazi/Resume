//
//  ContactViewController.m
//  Graziano Resume
//
//  Created by Mike Graziano on 2/11/13.
//  Copyright (c) 2013 Mike Graziano. All rights reserved.
//

#import <MessageUI/MFMailComposeViewController.h>
#import "ContactViewController.h"
#import "DataHandler.h"

@interface ContactViewController ()

@property (strong, nonatomic) NSArray *contactArray;
@property (strong, nonatomic) NSMutableArray *cellTypes;

@end

@implementation ContactViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setContactArray:(NSArray *)[[DataHandler publicDataHandler] getResumeDataForKey:@"Contact"]];
    self.cellTypes = [[NSMutableArray alloc] initWithCapacity:[self.contactArray count]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.contactArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ContactCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];

    NSDictionary *contactDict = [self.contactArray objectAtIndex:indexPath.row];
    [cell.textLabel setText:[contactDict valueForKey:@"Method"]];
    [cell.detailTextLabel setText:[contactDict valueForKey:@"Value"]];
    
    if ([(NSString *)[contactDict objectForKey:@"Method"] isEqualToString:@"Phone"]) {
        [self.cellTypes insertObject:@"phone" atIndex:indexPath.row];
    }
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if ([[self.cellTypes objectAtIndex:indexPath.row] isEqualToString:@"phone"]) {
        UIDevice *device = [UIDevice currentDevice];
        if ([[device model] isEqualToString:@"iPhone"] ) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel:215-520-1747"]]];
        } else {
            UIAlertView *Notpermitted=[[UIAlertView alloc] initWithTitle:@"Alert" message:@"Calling." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [Notpermitted show];
        }
    } 
}

@end
