//
//  EmploymentCell.h
//  Graziano Resume
//
//  Created by Mike Graziano on 2/5/13.
//  Copyright (c) 2013 Mike Graziano. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EmploymentCell : UITableViewCell

@property (nonatomic, retain) IBOutlet UILabel *yearsLabel;
@property (nonatomic, retain) IBOutlet UILabel *companyLabel;
@property (nonatomic, retain) IBOutlet UILabel *positionLabel;
@property (nonatomic) NSInteger rowNumber;

@end
