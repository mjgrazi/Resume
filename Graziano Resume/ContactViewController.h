//
//  ContactViewController.h
//  Graziano Resume
//
//  Created by Mike Graziano on 2/11/13.
//  Copyright (c) 2013 Mike Graziano. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>

@interface ContactViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *theTableView;

@end
