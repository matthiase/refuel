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
#import "PRXLabel.h"
#import "UIColor+Custom.h"

@interface PRXSideMenuViewController ()
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIView *statusBarUnderlay;
@property (nonatomic, strong) NSArray *fuelTypes;
@property (nonatomic, strong) NSArray *aboutSectionItems;
@end

@implementation PRXSideMenuViewController

typedef enum TableViewSection : NSInteger {
    TableViewSectionFuelTypes = 0,
    TableViewSectionAbout,
    TableViewSectionCount
} TableViewSection;


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.fuelTypes = [[NSArray alloc] initWithArray:[PRXFuelType allFuelTypes] copyItems:YES];
    
    self.aboutSectionItems = [NSArray arrayWithObjects:@"Support", @"Terms of Service", @"Privacy Policy", nil];
    
    self.statusBarUnderlay = [[UIView alloc] initWithFrame:CGRectZero];
    [self.statusBarUnderlay setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.statusBarUnderlay setBackgroundColor:[UIColor lightGrayColor]];
    [self.statusBarUnderlay setAlpha:0.3f];
    [self.view addSubview:self.statusBarUnderlay];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    [self.tableView setTranslatesAutoresizingMaskIntoConstraints:NO];
    //[self.tableView setBackgroundColor:[UIColor lightTextColor]];
    [self.tableView setDataSource:self];
    [self.tableView setDelegate:self];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"FuelTypeCell"];
    [self.view addSubview:self.tableView];
}


- (void) updateViewConstraints {
    [super updateViewConstraints];

    [self.view addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"H:|[_statusBarUnderlay]|"
                               options:0
                               metrics:nil
                               views:NSDictionaryOfVariableBindings(_statusBarUnderlay)]];
    
    [self.view addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"H:|[_tableView]|"
                               options:0
                               metrics:nil
                               views:NSDictionaryOfVariableBindings(_tableView)]];
    
    [self.view addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"V:|[_statusBarUnderlay(20)][_tableView]|"
                               options:0
                               metrics:nil
                               views:NSDictionaryOfVariableBindings(_statusBarUnderlay, _tableView)]];
    
}



- (MFSideMenuContainerViewController *)menuContainerViewController {
    return (MFSideMenuContainerViewController *)self.parentViewController;
}


#pragma mark - UITableViewDataSource methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return TableViewSectionCount;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger numberOfRows = 0;
    if (section == TableViewSectionFuelTypes) {
        numberOfRows = self.fuelTypes.count;
    } else if (section == TableViewSectionAbout) {
        numberOfRows = self.aboutSectionItems.count;
    }
    return numberOfRows;
}


#pragma mark - UITableViewDelegate methods

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *reuseIdentifier = @"FuelTypeCell";
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    if (indexPath.section == TableViewSectionFuelTypes) {
        PRXFuelType *item = [self.fuelTypes objectAtIndex:indexPath.row];
        cell.textLabel.text = item.name;
        
        PRXPreferences *preferences = [PRXPreferences sharedInstance];
        if ([preferences indexOfObjectInFuelsWithCode:item.code] != NSNotFound) {
            [cell setAccessoryType:UITableViewCellAccessoryCheckmark];
        }
    } else if (indexPath.section == TableViewSectionAbout) {
        cell.textLabel.text = [self.aboutSectionItems objectAtIndex:indexPath.row];
        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    }
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == TableViewSectionFuelTypes) {
        UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
        PRXFuelType *item = [self.fuelTypes objectAtIndex:indexPath.row];
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
    }
    //[self.tableView deselectRowAtIndexPath:indexPath animated:NO];
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 31.0f;
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    PRXLabel *label = [[PRXLabel alloc] initWithFrame:CGRectZero];
    [label setInsets:UIEdgeInsetsMake(0, 10, 0, 10)];
    [label setBackgroundColor:[UIColor rflMediumBlueColor]];
    [label setTextColor:[UIColor lightTextColor]];
    if (section == TableViewSectionFuelTypes) {
        [label setText:NSLocalizedString(@"FUEL TYPES", @"Fuel type section header.")];
    } else if (section == TableViewSectionAbout) {
        [label setText:NSLocalizedString(@"HELP & ABOUT", @"About section header")];
    }
    
    return label;
}


- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.0f;
}


- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return nil;
}


@end
