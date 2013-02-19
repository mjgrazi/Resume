//
//  FirstViewController.m
//  Graziano Resume
//
//  Created by Mike Graziano on 2/3/13.
//  Copyright (c) 2013 Mike Graziano. All rights reserved.
//

#import "AboutMeViewController.h"
#import "AboutHeaderCell.h"
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
}

#pragma mark UITableView methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AboutHeaderCell *cell = (AboutHeaderCell*)[tableView dequeueReusableCellWithIdentifier:@"AboutHeaderCell"];
        
    if (cell == nil) {
        cell = [[AboutHeaderCell alloc] init];
    }
    [cell.answerLabel setText:[[self.aboutArray objectAtIndex:(indexPath.row)] valueForKey:@"Answer"]];
    [cell.questionLabel setText:[[self.aboutArray objectAtIndex:(indexPath.row)] valueForKey:@"Question"]];
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    CGFloat questionLabelHeight = [self getHeightOfLabel:[[self.aboutArray objectAtIndex:indexPath.row] valueForKey:@"Question"]
                                              ofFontSize:14
                                          withConstraint:CGSizeMake(280, 9999)];
    CGFloat answerLabelHeight = [self getHeightOfLabel:[[self.aboutArray objectAtIndex:indexPath.row] valueForKey:@"Answer"]
                                      ofFontSize:14
                                  withConstraint:CGSizeMake(280, 9999)];
    return questionLabelHeight + answerLabelHeight + 30;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.aboutArray count];
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
