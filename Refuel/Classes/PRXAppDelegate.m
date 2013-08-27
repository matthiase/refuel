//
//  PRXAppDelegate.m
//  Refuel
//
//  Created by Matthias Eder on 7/7/13.
//  Copyright (c) 2013 Matthias Eder. All rights reserved.
//

#import "PRXAppDelegate.h"
#import "MFSideMenuContainerViewController.h"
#import "PRXPreferences.h"
#import "PRXFuelType.h"

@implementation PRXAppDelegate

@synthesize window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSSetUncaughtExceptionHandler(&uncaughtExceptionHandler);
    
    /*
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSData *defaultPreferences = [NSKeyedArchiver archivedDataWithRootObject:[PRXPreferences sharedInstance]];
    NSDictionary *defaultValues = [NSDictionary dictionaryWithObject:defaultPreferences forKey:@"preferences"];
    [userDefaults registerDefaults:defaultValues];
    */
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:[NSBundle mainBundle]];
    MFSideMenuContainerViewController *container = (MFSideMenuContainerViewController *)self.window.rootViewController;
    UINavigationController *navigationController = [storyboard instantiateViewControllerWithIdentifier:@"NavigationController"];
    UIViewController *leftSideMenuViewController = [storyboard instantiateViewControllerWithIdentifier:@"SideMenuViewController"];
    
    [container setLeftMenuViewController:leftSideMenuViewController];
    [container setCenterViewController:navigationController];
    
    return YES;
}


// Log a stack trace any time a runtime crash occurs
void uncaughtExceptionHandler(NSException *exception) {
    NSLog(@"CRASH: %@", exception);
    NSLog(@"Stack Trace: %@", [exception callStackSymbols]);
}

@end
