//
//  PRXPreferences.h
//  Refuel
//
//  Created by Matthias Eder on 7/27/13.
//  Copyright (c) 2013 Matthias Eder. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PRXPreferences : NSObject<NSCoding>

+ (PRXPreferences *)sharedInstance;

- (id)initWithDefaults;

- (NSArray *)selectedFuelCodes;

// Implement index array accessors to make the Fuels array KVO compliant
- (NSUInteger)countOfFuels;
- (NSUInteger)indexOfObjectInFuels:(id)obj;
- (NSUInteger)indexOfObjectInFuelsWithCode:(NSString *)code;
- (id)objectInFuelsAtIndex:(NSUInteger)index;
- (void)insertObject:(id)obj inFuelsAtIndex:(NSUInteger)index;
- (void)insertFuels:(NSArray *)array atIndexes:(NSIndexSet *)indexes;
- (void)removeObjectFromFuelsAtIndex:(NSUInteger)index;
- (void)removeFuelsAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInFuelsAtIndex:(NSUInteger)index withObject:(id)obj;
- (void)replaceFuelsAtIndexes:(NSIndexSet *)indexes withFuels:(NSArray *)array;

@end
