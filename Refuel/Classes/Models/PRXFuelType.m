//
//  PRXFuelType.m
//  Refuel
//
//  Created by Matthias Eder on 7/19/13.
//  Copyright (c) 2013 Matthias Eder. All rights reserved.
//

#import "PRXFuelType.h"

@interface PRXFuelType () {

}
@end

@implementation PRXFuelType

#pragma mark - Class Metadata

static NSString *const PRXFuelTypeClassName = @"PRXFuelType";
static NSInteger const PRXFuelTypeVersion = 1;
static NSString *const PRXFuelTypeNameKey = @"name";
static NSString *const PRXFuelTypeCodeKey = @"code";


#pragma mark - Class Methods

+ (NSArray *)allFuelTypes
{
    static NSArray *_allFuelTypes = nil;
    if (!_allFuelTypes ) {
        _allFuelTypes = [NSArray arrayWithObjects:
                         [[PRXFuelType alloc]initWithName:@"Ethanol (E85)" andCode:@"E85"],
                         [[PRXFuelType alloc]initWithName:@"Electric" andCode:@"ELEC"],
                         [[PRXFuelType alloc]initWithName:@"Biodiesel (B20+)" andCode:@"BD"],
                         nil];
    }
    return _allFuelTypes;
}


# pragma mark - Inializers

// Designated initializer
- (id)initWithName:(NSString *)name andCode:(NSString *)code
{
    self = [super init];
    if (self) {
        [[self class] setVersion:PRXFuelTypeVersion];
        _name = name;
        _code = code;
    }
    return self;
}

- (id)init
{
    return [self initWithName:@"" andCode:@""];
}


#pragma mark - NSObject

- (BOOL)isEqual:(id)object {
    return [object isKindOfClass:[self class]] && [self.code isEqualToString:((PRXFuelType *)object).code];
}


- (NSUInteger) hash {
    return [self.code hash];
}


#pragma mark - NSCoding

- (id)initWithCoder:(NSCoder *)decoder {
    // Don't even try to decode old version of this class.
    NSInteger version = [decoder versionForClassName:PRXFuelTypeClassName];
    if (version < PRXFuelTypeVersion) {
        return nil;
    }
    
    self = [self init];
    if (self) {
        _name = [decoder decodeObjectForKey:PRXFuelTypeNameKey];
        _code = [decoder decodeObjectForKey:PRXFuelTypeCodeKey];
    }
    return self;
}


- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:self.name forKey:PRXFuelTypeNameKey];
    [encoder encodeObject:self.code forKey:PRXFuelTypeCodeKey];
}


#pragma mark - NSCopying methods

- (id)copyWithZone:(NSZone *)zone
{
    return [[PRXFuelType alloc]
            initWithName:[self.name copyWithZone:zone]
            andCode:[self.code copyWithZone:zone]];
}

@end
