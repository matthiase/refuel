//
//  StreetViewClient.m
//  Refuel
//
//  Created by Matthias Eder on 9/7/13.
//  Copyright (c) 2013 Matthias Eder. All rights reserved.
//

#import "StreetViewClient.h"



@implementation StreetViewClient

static StreetViewClient *SharedInstance = nil;
static NSString * const kServiceBaseUrl = @"http://maps.googleapis.com/maps/api/streetview";

+ (StreetViewClient *)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSURL *baseURL = [NSURL URLWithString:kServiceBaseUrl];
        SharedInstance = [[StreetViewClient alloc] initWithBaseURL:baseURL];
    });
    return SharedInstance;
}


- (id)initWithBaseURL:(NSURL *)url {
    self = [super initWithBaseURL:url];
    if (self) {
        [self setParameterEncoding:AFFormURLParameterEncoding];
        [self registerHTTPOperationClass:[AFJSONRequestOperation class]];
        [self setDefaultHeader:@"Accept" value:@"application/json"];
    }
    return self;    
}


@end
