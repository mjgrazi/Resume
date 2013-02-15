//
//  DataParser.h
//  Grázumé
//
//  Created by Mike Graziano on 2/14/13.
//  Copyright (c) 2013 Mike Graziano. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataHandler : NSObject


- (NSArray *)getResumeDataForKey:(NSString *)key;
+ (DataHandler *)publicDataHandler;

@end
