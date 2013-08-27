//
//  PRXMapViewController
//  Refuel
//
//  Created by Matthias Eder on 7/7/13.
//  Copyright (c) 2013 Matthias Eder. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface PRXMapViewController : UIViewController
    <CLLocationManagerDelegate, UITextFieldDelegate, MKMapViewDelegate, UIGestureRecognizerDelegate>
@end
