//
//  PRXAnnotation.h
//  Refuel
//
//  Created by Matthias Eder on 7/11/13.
//  Copyright (c) 2013 Matthias Eder. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MKAnnotation.h>

@interface PRXAnnotation : NSObject  <MKAnnotation> {

}

- (id)initWithCoordinate:(CLLocationCoordinate2D)coordinate title:(NSString *)title;
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;
@property (nonatomic, strong) NSDictionary *stationInfo;

@end
