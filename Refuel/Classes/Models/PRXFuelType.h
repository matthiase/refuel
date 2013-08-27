//
//  PRXFuelType.h
//  Refuel
//
//  Created by Matthias Eder on 7/19/13.
//  Copyright (c) 2013 Matthias Eder. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PRXFuelType : NSObject<NSCoding, NSCopying> {
    
}

+(NSArray *) allFuelTypes;

@property (nonatomic) NSString *name;
@property (nonatomic) NSString *code;

- (id)initWithName:(NSString *)name andCode:(NSString *)code;

@end
