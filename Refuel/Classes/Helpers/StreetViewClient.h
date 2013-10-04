//
//  StreetViewClient.h
//  Refuel
//
//  Created by Matthias Eder on 9/7/13.
//  Copyright (c) 2013 Matthias Eder. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPClient.h"
#import "AFJSONRequestOperation.h"

@interface StreetViewClient : AFHTTPClient

+ (StreetViewClient *)sharedInstance;

- requestImage:(NSDictionary *)params completion:(void(^)(UIImage *, NSError *))block;

@end
