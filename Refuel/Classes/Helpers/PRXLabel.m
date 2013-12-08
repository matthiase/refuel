//
//  PRXLabel.m
//  Refuel
//
//  Created by Matthias Eder on 10/4/13.
//  Copyright (c) 2013 Matthias Eder. All rights reserved.
//

#import "PRXLabel.h"

@implementation PRXLabel

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _insets = UIEdgeInsetsZero;
    }
    return self;
}

- (void)drawTextInRect:(CGRect)rect
{
    return [super drawTextInRect:UIEdgeInsetsInsetRect(rect, self.insets)];
}

@end
