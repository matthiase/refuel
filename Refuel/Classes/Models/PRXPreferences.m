//
//  PRXPreferences.m
//  Refuel
//
//  Created by Matthias Eder on 7/27/13.
//  Copyright (c) 2013 Matthias Eder. All rights reserved.
//

#import "PRXPreferences.h"
#import "PRXFuelType.h"
#import "NSArray+Map.h"

@interface PRXPreferences () {

}
@property (nonatomic, strong) NSMutableArray *fuels;
@end



@implementation PRXPreferences

static PRXPreferences *SharedInstance;

#pragma mark - Class Metadata

static NSString *const PRXPreferencesClassName = @"PRXPreferences";
static NSInteger const PRXPreferencesVersion = 1;
static NSString *const PRXPreferencesFuelsKey = @"fuels";


#pragma mark - Class Methods

+ (PRXPreferences *)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SharedInstance = [[PRXPreferences alloc] initWithDefaults];
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        NSData *data = [userDefaults objectForKey:@"preferences"];
        if (data) {
            SharedInstance = [NSKeyedUnarchiver unarchiveObjectWithData:data];
        }
    });
    return SharedInstance;
}


#pragma mark - Initializers

- (id)init {
    self = [super init];
    if (self) {
        [[self class] setVersion:PRXPreferencesVersion];
        _fuels = [NSMutableArray new];
    }
    return self;
}


- (id)initWithDefaults {
    self = [self init];
    if (self) {
        _fuels = [NSMutableArray arrayWithArray:[PRXFuelType allFuelTypes]];
    }
    return self;
}


#pragma mark - NSCoding

- (id)initWithCoder:(NSCoder *)decoder {
    // Don't even try to decode old versions of this class.
    NSInteger version = [decoder versionForClassName:PRXPreferencesClassName];
    if (version < PRXPreferencesVersion) {
        return nil;
    }
    
    self = [self init];
    if (self) {
        _fuels = [decoder decodeObjectForKey:PRXPreferencesFuelsKey];
    }
    return self;
}


- (void)encodeWithCoder:(NSCoder *)encoder {    
    [encoder encodeObject:self.fuels forKey:PRXPreferencesFuelsKey];
}


#pragma mark - Instance Methods

- (NSUInteger)countOfFuels {
    return self.fuels.count;
}

- (NSUInteger)indexOfObjectInFuels:(id)obj {
    return [self.fuels indexOfObject:obj];
}

- (NSUInteger)indexOfObjectInFuelsWithCode:(NSString *)code {
    return[self.fuels indexOfObjectPassingTest:^BOOL(id obj, NSUInteger idx, BOOL *stop) {
        return [code isEqualToString:((PRXFuelType *)obj).code];
    }];
}

- (id)objectInFuelsAtIndex:(NSUInteger)index {
    return [self.fuels objectAtIndex:index];
}

- (void)insertObject:(id)obj inFuelsAtIndex:(NSUInteger)index {
    [self.fuels insertObject:obj atIndex:index];
}

- (void)insertFuels:(NSArray *)array atIndexes:(NSIndexSet *)indexes {
    [self.fuels insertObjects:array atIndexes:indexes];
}

- (void)removeObjectFromFuelsAtIndex:(NSUInteger)index {
    [self.fuels removeObjectAtIndex:index];
}

- (void)removeFuelsAtIndexes:(NSIndexSet *)indexes {
    [self.fuels removeObjectsAtIndexes:indexes];
}

- (void)replaceObjectInFuelsAtIndex:(NSUInteger)index withObject:(id)obj {
    [self.fuels replaceObjectAtIndex:index withObject:obj];
}

- (void)replaceFuelsAtIndexes:(NSIndexSet *)indexes withFuels:(NSArray *)array {
    [self.fuels replaceObjectsAtIndexes:indexes withObjects:array];
}




- (NSArray *)selectedFuelCodes {    
    NSArray *codes = [self.fuels mapObjectsUsingBlock:^id(id obj, NSUInteger idx) {
        NSString *code = @"";
        if ([obj isKindOfClass:[PRXFuelType class]]) {
            code = ((PRXFuelType *)obj).code;
        }
        return code;
    }];
    return codes;
}







@end
