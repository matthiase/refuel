//
//  NRELClient.h
//  Refuel
//
//  Created by Matthias Eder on 7/12/13.
//  Copyright (c) 2013 Matthias Eder. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPClient.h"

@interface NRELClient : AFHTTPClient

+ (NRELClient *)sharedClient;
+ (void)connect;

@end
