//
//  FirstViewController.h
//  Graziano Resume
//
//  Created by Mike Graziano on 2/3/13.
//  Copyright (c) 2013 Mike Graziano. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AboutMeViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end
