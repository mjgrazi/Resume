//
//  FirstViewController.m
//  Graziano Resume
//
//  Created by Mike Graziano on 2/3/13.
//  Copyright (c) 2013 Mike Graziano. All rights reserved.
//

#import "AboutMeViewController.h"
#import "AboutHeaderCell.h"
#import "AboutDetailCell.h"
#import "DataHandler.h"


@interface AboutMeViewController ()

@property (strong, nonatomic) NSArray *aboutArray;

@end

@implementation AboutMeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setAboutArray:(NSArray *)[[DataHandler publicDataHandler] getResumeDataForKey:@"About"]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UITableView methods

//- (void)tableView:(UITableView *)tableview willDisplayCell:(EmploymentCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    UIColor *color = ((indexPath.row % 2) == 0) ? [UIColor clearColor] : [UIColor colorWithRed: 215.0/255.0 green: 215.0/255.0 blue: 215.0/255.0 alpha:1];
//    cell.backgroundColor = color;
//    tableview.separatorColor = [[UIColor alloc] initWithRed:0 green:0 blue:0 alpha:0.5];
//}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    if (indexPath.row % 2) {
        AboutDetailCell *cell = (AboutDetailCell*)[tableView dequeueReusableCellWithIdentifier:@"AboutDetailCell"];
        
        if (cell == nil) {
            cell = [[AboutDetailCell alloc] init];
        }
        [cell.answerLabel setText:[[self.aboutArray objectAtIndex:(indexPath.row/2)] valueForKey:@"Answer"]];
        return cell;
    } else {
        AboutHeaderCell *cell = (AboutHeaderCell*)[tableView dequeueReusableCellWithIdentifier:@"AboutHeaderCell"];
        
        if (cell == nil) {
            cell = [[AboutHeaderCell alloc] init];
        }
        [cell.headerLabel setText:[[self.aboutArray objectAtIndex:(indexPath.row/2)] valueForKey:@"Question"]];
        return cell;
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (!(indexPath.row % 2)) {
        return 22;
    } else {
        return [self getHeightOfLabel:[[self.aboutArray objectAtIndex:(indexPath.row/2)] valueForKey:@"Answer"]
                           ofFontSize:14
                       withConstraint:CGSizeMake(280, 9999)] + 8;
    }
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2 * [self.aboutArray count];
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] init];
    return view;
}

- (CGFloat) getHeightOfLabel:(NSString *)text ofFontSize:(CGFloat)fontSize withConstraint:(CGSize)constraint
{
    CGSize size = [text sizeWithFont:[UIFont systemFontOfSize:fontSize] constrainedToSize:constraint];
    return size.height;
}

@end
