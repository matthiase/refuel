//
//  StreetViewURLBuilder.m
//  Refuel
//
//  Created by Matthias Eder on 10/4/13.
//  Copyright (c) 2013 Matthias Eder. All rights reserved.
//

#import "StreetViewURLBuilder.h"

@implementation StreetViewURLBuilder

static NSString * const kStreetViewBaseUrlString = @"http://maps.googleapis.com/maps/api/streetview";

+ (NSURL *)urlForLocation:(CGPoint)location options:(NSDictionary *)options {
    NSString *queryString = [NSString stringWithFormat:@"size=320x320&location=%f,%f&fov=120&heading=235&pitch=-10&sensor=false", location.x, location.y];
    return [NSURL URLWithString:[NSString stringWithFormat:@"%@?%@", kStreetViewBaseUrlString, queryString]];
}

@end
