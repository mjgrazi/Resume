//
//  EmploymentDetailViewController.h
//  Graziano Resume
//
//  Created by Mike Graziano on 2/5/13.
//  Copyright (c) 2013 Mike Graziano. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Job;

@interface EmploymentDetailViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) Job *theJob;
@property (strong, nonatomic) IBOutlet UITableView *responsibilitiesTable;
@property (strong, nonatomic) IBOutlet UILabel *companyLabel;
@property (strong, nonatomic) IBOutlet UILabel *positionLabel;
@property (strong, nonatomic) IBOutlet UILabel *yearsLabel;
@property (strong, nonatomic) IBOutlet UIImageView *companyLogo;

@end
