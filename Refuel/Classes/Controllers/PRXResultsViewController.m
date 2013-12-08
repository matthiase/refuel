//
//  PRXResultsViewController.m
//  Refuel
//
//  Created by Matthias Eder on 8/25/13.
//  Copyright (c) 2013 Matthias Eder. All rights reserved.
//

#import "PRXResultsViewController.h"
#import "PRXDetailsViewController.h"
#import "UIColor+Custom.h"
#import <QuartzCore/QuartzCore.h>

@interface PRXResultsViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation PRXResultsViewController

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
    
    [self.navigationItem setBackBarButtonItem:[[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil]];
    [self.navigationItem setTitle:[NSString stringWithFormat:@"Found %i Stations", self.results.count]];
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"presentDetailsView"]) {
        PRXDetailsViewController *destinationController = [segue destinationViewController];
        NSIndexPath *selectedIndex = [self.tableView indexPathForSelectedRow];
        [destinationController setStationInfo:[self.results objectAtIndex:selectedIndex.row]];
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Properties

- (NSArray *)results {
    if (_results == nil) {
        _results = [NSArray new];
    }
    return _results;
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.results.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"ResultsCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    NSDictionary *stationInfo = [self.results objectAtIndex:indexPath.row];
    [cell.textLabel setText:[stationInfo objectForKey:@"station_name"]];
    [cell.detailTextLabel setText:[NSString stringWithFormat:@"%@, %@, %@",
                                   stationInfo[@"street_address"],
                                   stationInfo[@"city"],
                                   stationInfo[@"state"]]];
    return cell;
}


@end
