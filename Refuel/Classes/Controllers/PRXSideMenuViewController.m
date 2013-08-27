//
//  PRXSideMenuViewController.m
//  Refuel
//
//  Created by Matthias Eder on 7/8/13.
//  Copyright (c) 2013 Matthias Eder. All rights reserved.
//

#import "PRXSideMenuViewController.h"
#import "MFSideMenuContainerViewController.h"
#import "PRXPreferences.h"
#import "PRXFuelType.h"

@interface PRXSideMenuViewController () {
    NSArray *fuelTypes;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation PRXSideMenuViewController

- (void)viewDidLoad
{
    [super viewDidLoad];    
    fuelTypes = [[NSArray alloc] initWithArray:[PRXFuelType allFuelTypes] copyItems:YES];
}

- (MFSideMenuContainerViewController *)menuContainerViewController {
    return (MFSideMenuContainerViewController *)self.parentViewController;
}


#pragma mark - UITableViewDataSource methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger numberOfRows = 0;
    if (section == 0) {
        numberOfRows = fuelTypes.count;
    }
    return numberOfRows;
}


#pragma mark - UITableViewDelegate methods

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *reuseIdentifier = @"FuelTypeCell";
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    }
    
    PRXFuelType *item = [fuelTypes objectAtIndex:indexPath.row];
    cell.textLabel.text = item.name;
    
    PRXPreferences *preferences = [PRXPreferences sharedInstance];
    if ([preferences indexOfObjectInFuelsWithCode:item.code] != NSNotFound) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    PRXFuelType *item = [fuelTypes objectAtIndex:indexPath.row];
    PRXPreferences *preferences = [PRXPreferences sharedInstance];
    
    if (cell.accessoryType == UITableViewCellAccessoryCheckmark) {
        cell.accessoryType = UITableViewCellAccessoryNone;
        NSUInteger index = [preferences indexOfObjectInFuelsWithCode:item.code];        
        [preferences removeObjectFromFuelsAtIndex:index];
        
    }
    else {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        [preferences insertObject:item inFuelsAtIndex:[preferences countOfFuels]];
    }
    [self.tableView deselectRowAtIndexPath:indexPath animated:NO];    
}

@end
