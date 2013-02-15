//
//  ContactViewController.m
//  Graziano Resume
//
//  Created by Mike Graziano on 2/11/13.
//  Copyright (c) 2013 Mike Graziano. All rights reserved.
//

#import <MessageUI/MFMailComposeViewController.h>
#import "ContactViewController.h"

@interface ContactViewController ()


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
    if (section == 0) {
        return 2;
    } else return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ContactCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if (indexPath.section == 0)
    {
        if (indexPath.row == 0)
        {
            [cell.detailTextLabel setText:@"215-520-1747"];
            [cell.textLabel setText:@"Cell"];
        } else if (indexPath.row == 1)
        {
            [cell.detailTextLabel setText:@"mjgrazi@gmail.com"];
            [cell.textLabel setText:@"e-mail"];
        }
    }
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row == 0) {
        UIDevice *device = [UIDevice currentDevice];
        if ([[device model] isEqualToString:@"iPhone"] ) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel:215-520-1747"]]];
        } else {
            UIAlertView *Notpermitted=[[UIAlertView alloc] initWithTitle:@"Alert" message:@"Calling." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [Notpermitted show];
        }
    } else if(indexPath.row == 1) {
        //Write code to send email from within app
    }
}

//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
//    if (section == 0) {
//        return @"Traditional";
//    } else if(section == 1) {
//        return @"Social Media";
//    }
//}

@end
