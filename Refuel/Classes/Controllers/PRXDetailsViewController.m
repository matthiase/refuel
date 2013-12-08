//
//  PRXDetailsViewController.m
//  Refuel
//
//  Created by Matthias Eder on 8/31/13.
//  Copyright (c) 2013 Matthias Eder. All rights reserved.
//

#import "PRXDetailsViewController.h"
#import "StreetViewURLBuilder.h"

#import "UIImageView+AFNetworking.h"
#import "UIColor+Custom.h"
#import <QuartzCore/QuartzCore.h>

@interface PRXDetailsViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *streetImageView;
@property (weak, nonatomic) IBOutlet UILabel *stationInfoLabel;
@property (weak, nonatomic) IBOutlet UILabel *stationDistanceLabel;
@property (weak, nonatomic) IBOutlet UILabel *stationPhoneNumberLabel;
@end

@implementation PRXDetailsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.navigationItem setTitle:@"Station Detail"];
    
    [self.stationInfoLabel setNumberOfLines:0];
    NSArray *stationInfoLines = [NSArray arrayWithObjects:
                                 [self.stationInfo objectForKey:@"station_name"],
                                 [self.stationInfo objectForKey:@"street_address"],
                                 [NSString stringWithFormat:@"%@, %@ %@",
                                    [self.stationInfo objectForKey:@"city"],
                                    [self.stationInfo objectForKey:@"state"],
                                    [self.stationInfo objectForKey:@"zip"]                                      
                                  ]
                                 , nil];
            
    [self.stationInfoLabel setText:[stationInfoLines componentsJoinedByString:@"\n"]];    
    [self.stationInfoLabel sizeToFit];
    
    NSNumberFormatter *distanceFormatter = [[NSNumberFormatter alloc] init];
    [distanceFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
    [distanceFormatter setMaximumFractionDigits:2];
    [distanceFormatter setRoundingMode: NSNumberFormatterRoundUp];
    [self.stationDistanceLabel setText:[distanceFormatter stringFromNumber:[self.stationInfo objectForKey:@"distance"]]];
    
    //
    // Some stations list multiple phone numbers.  Just show the first one.
    //
    NSString *primaryPhoneNumber = [self.stationInfo objectForKey:@"station_phone"];
    NSArray *phoneNumbers = [primaryPhoneNumber componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    if (phoneNumbers.count > 0) {
        primaryPhoneNumber = [phoneNumbers objectAtIndex:0];
    }    
    [self.stationPhoneNumberLabel setText:primaryPhoneNumber];
    
    CGFloat latitude = [[self.stationInfo objectForKey:@"latitude"] floatValue];
    CGFloat longitude = [[self.stationInfo objectForKey:@"longitude"] floatValue];
    CGPoint location = CGPointMake(latitude, longitude);
    
    NSURL *streetViewURL = [StreetViewURLBuilder urlForLocation:location options:nil];
    //NSLog(@"%@", [streetViewURL absoluteString]);
    [self.streetImageView setImageWithURL:streetViewURL];
}

@end
