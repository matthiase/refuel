//
//  NRELClient.m
//  Refuel
//
//  Created by Matthias Eder on 7/12/13.
//  Copyright (c) 2013 Matthias Eder. All rights reserved.
//

/*
 curl -XGET "http://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?api_key=YOUR_KEY_HERE&latitude=40.0150&longitude=-105.2700"
 */

#import "NRELClient.h"
#import "AFJSONRequestOperation.h"


static NRELClient *_sharedClient = nil;

@implementation NRELClient

static NSString * const kServiceUrl = @"http://developer.nrel.gov/api";

+ (NRELClient *)sharedClient {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self connect];
    });
    
    return _sharedClient;
}


+(void)connect {
    NSURL *baseUrl = [NSURL URLWithString:kServiceUrl];
    _sharedClient = [[[self class] alloc] initWithBaseURL:baseUrl];
}


- (id)initWithBaseURL:(NSURL *)url {
    self = [super initWithBaseURL:url];
    if (!self) {
        return nil;
    }
    
    [self setParameterEncoding:AFFormURLParameterEncoding];
    [self registerHTTPOperationClass:[AFJSONRequestOperation class]];
    
    // Accept HTTP Header; see http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.1
	[self setDefaultHeader:@"Accept" value:@"application/json"];
    
    return self;
}
@end
