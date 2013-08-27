//
//  UIColor+Custom.m
//  Refuel
//
//  Created by Matthias Eder on 8/18/13.
//  Copyright (c) 2013 Matthias Eder. All rights reserved.
//

#import "UIColor+Custom.h"

@implementation UIColor (Custom)

+ (UIColor *)rflMediumBlueColor {
    return [UIColor colorWithRed:78.0f/256.0f green:132.0f/256.0f blue:183.0f/256.0f alpha:1.0f];
}

+ (UIColor *)rflHighlightedBlueColor {
    return [UIColor colorWithRed:78.0f/256.0f green:132.0f/256.0f blue:183.0f/256.0f alpha:0.5f];
}

+ (UIColor *)rflLightGrayColor {
	return [UIColor colorWithRed:(216.0f/256.0f) green:(216.0f/256.0f) blue:(215.0f/256.0f) alpha:1.0f];
}

@end
