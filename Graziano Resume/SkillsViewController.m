//
//  SkillsViewController.m
//  Grázumé
//
//  Created by Mike Graziano on 2/13/13.
//  Copyright (c) 2013 Mike Graziano. All rights reserved.
//

#import "SkillsViewController.h"
#import "DataHandler.h"

@interface SkillsViewController ()

@property (strong, nonatomic) NSArray *skillsArray;
@property (strong, nonatomic) NSArray *softwareSkills;
@property (strong, nonatomic) NSArray *languageSkills;
@property (strong, nonatomic) NSArray *dataSkills;
@property (strong, nonatomic) NSArray *operatingSystemSkills;

@end

@implementation SkillsViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setSkillsArray:[[DataHandler publicDataHandler] getResumeDataForKey:@"Skills"]];
    self.softwareSkills = (NSArray *)[self.skillsArray valueForKey:@"Software"];
    self.operatingSystemSkills = (NSArray *)[self.skillsArray valueForKey:@"Operating Systems"];
    self.dataSkills = (NSArray *)[self.skillsArray valueForKey:@"Data"];
    self.languageSkills = (NSArray *)[self.skillsArray valueForKey:@"Languages"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *titleString;
    switch (section) {
        case 0:
            titleString = @"Languages and Frameworks";
            break;
        case 1:
            titleString = @"Software";
            break;
        case 2:
            titleString = @"Data Handling";
            break;
        case 3:
            titleString = @"Operating Systems";
            break;
        default:
            break;
    }
    return titleString;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.skillsArray count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger cellCount = 0;
    
    switch (section) {
        case 0:
            cellCount = [self.languageSkills count];
            break;
        case 1:
            cellCount = [self.softwareSkills count];
            break;
        case 2:
            cellCount = [self.dataSkills count];
            break;
        case 3:
            cellCount = [self.operatingSystemSkills count];
            break;
        default:
            break;
    }
    
    return cellCount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"skillCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    [cell setUserInteractionEnabled:NO];

    NSString *cellLabel = @"";
    
    switch (indexPath.section) {
        case 0:
            cellLabel = [self.languageSkills objectAtIndex:indexPath.row];
            break;
        case 1:
            cellLabel = [self.softwareSkills objectAtIndex:indexPath.row];
            break;
        case 2:
            cellLabel = [self.dataSkills objectAtIndex:indexPath.row];
            break;
        case 3:
            cellLabel = [self.operatingSystemSkills objectAtIndex:indexPath.row];
            break;
        default:
            break;
    }
    
    [cell.textLabel setText:cellLabel];
    
    return cell;
}


#pragma mark - Table view delegate
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section != 3) {
        return 0;
    }
    return 10;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if (section == 3) {
        UIView *view = [[UIView alloc] init];
        return view;
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 32;
}

@end
