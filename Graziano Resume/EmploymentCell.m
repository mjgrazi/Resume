//
//  EmploymentCell.m
//  Graziano Resume
//
//  Created by Mike Graziano on 2/5/13.
//  Copyright (c) 2013 Mike Graziano. All rights reserved.
//

#import "EmploymentCell.h"

@implementation EmploymentCell

@synthesize companyLabel, yearsLabel, positionLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
