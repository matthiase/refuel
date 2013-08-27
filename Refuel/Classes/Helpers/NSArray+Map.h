//
//  NSArray+Map.h
//  Refuel
//
//  Created by Matthias Eder on 8/17/13.
//  Copyright (c) 2013 Matthias Eder. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (Map)

- (NSArray *)mapObjectsUsingBlock:(id (^)(id obj, NSUInteger idx))block;

@end
