//
//  StreetViewURLBuilder.h
//  Refuel
//
//  Created by Matthias Eder on 10/4/13.
//  Copyright (c) 2013 Matthias Eder. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StreetViewURLBuilder : UIAlertView

+ (NSURL *)urlForLocation:(CGPoint)location options:(NSDictionary *)options;

@end
