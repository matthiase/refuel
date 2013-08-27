//
//  PRXAnnotation.m
//  Refuel
//
//  Created by Matthias Eder on 7/11/13.
//  Copyright (c) 2013 Matthias Eder. All rights reserved.
//

#import "PRXAnnotation.h"

@implementation PRXAnnotation
@synthesize coordinate = _coordinate, title = _title, subtitle = _subtitle;

- (id)initWithCoordinate:(CLLocationCoordinate2D)coordinate title:(NSString *)title {
    self = [super init];
    if (self) {
        _coordinate = coordinate;
        _title = title;
    }
    return self;
}

- (id)init {
    return [self initWithCoordinate:CLLocationCoordinate2DMake(40.0150, -105.2700) title:@"Boulder, CO"];
}

@end
