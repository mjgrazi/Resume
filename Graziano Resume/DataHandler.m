//
//  DataHandler.m
//  Grázumé
//
//  Created by Mike Graziano on 2/14/13.
//  Copyright (c) 2013 Mike Graziano. All rights reserved.
//

#import "DataHandler.h"

@interface DataHandler()

@property (strong, nonatomic) NSMutableArray *jsonArray;
@property (strong, nonatomic) NSMutableArray *jobs;
@property (strong, nonatomic) NSData *resumeData;

@end

#define RESUME_URL @"http://www.nsgraz.com/json/resumeNIL"
#define LOCAL_FILENAME @"resume"
#define LOCAL_FILETYPE @"json"

@implementation DataHandler

static DataHandler *publicDataHandler = nil;

+ (DataHandler *)publicDataHandler
{
    static DataHandler *publicDataHandler;
    
    @synchronized([DataHandler class])
    {
        if (!publicDataHandler) {
            publicDataHandler = [[self alloc] init];
        }
        return publicDataHandler;
    }
}

+ (id)alloc
{
    @synchronized([DataHandler class])
    {
        publicDataHandler = [super alloc];
        return publicDataHandler;
    }
    return nil;
}

- (id)init
{
    self = [super init];
    if (self) {
        [self retrieveResumeJSONData];
    }
    return self;
}

- (void)retrieveResumeJSONData
{
    NSData *jsonResume = [[NSData alloc] init];
    NSURL *url = [NSURL URLWithString:RESUME_URL];
    jsonResume = [NSData dataWithContentsOfURL:url];
    
    if (!jsonResume) {
        jsonResume = [self retrieveLocalJSONData];
    }
    [self setResumeData:jsonResume];
}

- (NSData *)retrieveLocalJSONData
{
    NSData *jsonData = [[NSData alloc] init];
    NSString *path = [[NSBundle mainBundle] pathForResource:LOCAL_FILENAME ofType: LOCAL_FILETYPE];
    jsonData = [NSData dataWithContentsOfFile:path];
    return jsonData;
}

- (NSArray *)getResumeDataForKey:(NSString *)key
{
    if ([[DataHandler publicDataHandler] resumeData]) {
        NSError *error = nil;
        id result = [NSJSONSerialization JSONObjectWithData:[[DataHandler publicDataHandler] resumeData] options:NSJSONReadingMutableContainers error:&error];
        if (!error) {
            NSLog(@"Data exists, ready to parse");
        }
        self.jsonArray = result;
        return [(NSArray *)[[self jsonArray] valueForKey:key] objectAtIndex:0];
    } else {
        return nil;
    }
}

@end