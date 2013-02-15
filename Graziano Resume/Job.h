//
//  Job.h
//  Graziano Resume
//
//  Created by Mike Graziano on 2/5/13.
//  Copyright (c) 2013 Mike Graziano. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Job : NSObject

@property (nonatomic, strong) NSString *companyName;
@property (nonatomic, strong) NSString *position;
@property (nonatomic, strong) NSString *years;
@property (nonatomic, strong) NSMutableArray *responsibilities;

@end
