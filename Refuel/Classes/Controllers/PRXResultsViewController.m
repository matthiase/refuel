//
//  PRXResultsViewController.m
//  Refuel
//
//  Created by Matthias Eder on 8/25/13.
//  Copyright (c) 2013 Matthias Eder. All rights reserved.
//

#import "PRXResultsViewController.h"
#import "UIColor+Custom.h"
#import <QuartzCore/QuartzCore.h>

@interface PRXResultsViewController ()
@property (weak, nonatomic) IBOutlet UIToolbar *toolbar;
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
    
    NSMutableArray *toolbarItems = [NSMutableArray new];    
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0 , 0.0f, self.view.frame.size.width, 21.0f)];
    [titleLabel setFont:[UIFont boldSystemFontOfSize:16.0]];
    [titleLabel setBackgroundColor:[UIColor clearColor]];
    [titleLabel setTextColor:[UIColor rflMediumBlueColor]];
    [titleLabel setText:[NSString stringWithFormat:@"Found %i Stations", self.results.count]];
    
    UIBarButtonItem *titleItem = [[UIBarButtonItem alloc] initWithCustomView:titleLabel];
    [toolbarItems addObject:titleItem];
    
    
    UIBarButtonItem *spacer = [[UIBarButtonItem alloc]
                               initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                               target:nil
                               action:nil];
    [toolbarItems addObject:spacer];
    
    UIButton *dismissButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [dismissButton setFrame:CGRectMake(0.0, 11.0f, 44.0f, 44.0f)];
    [dismissButton.titleLabel setFont:[UIFont systemFontOfSize:16.0]];
    [dismissButton setTitleColor:[UIColor rflMediumBlueColor] forState:UIControlStateNormal];
    [dismissButton setTitle:@"Done" forState:UIControlStateNormal];
    [dismissButton addTarget:self action:@selector(dismissButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *dismissButtonItem = [[UIBarButtonItem alloc] initWithCustomView:dismissButton];
    [dismissButton setTintColor:[UIColor rflMediumBlueColor]];
    [toolbarItems addObject:dismissButtonItem];
    
    [self.toolbar setTintColor:[UIColor whiteColor]];
    [self.toolbar setItems:toolbarItems animated:YES];
}


- (void)viewDidLayoutSubviews
{
    // TODO: this should only be performed once.
    CALayer *layer = [CALayer layer];
    layer.frame = CGRectMake(0.0f, self.toolbar.bounds.size.height - 1, self.toolbar.bounds.size.width, 1.0f);
    [layer setBackgroundColor:[UIColor lightGrayColor].CGColor];
    [self.toolbar.layer addSublayer:layer];
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

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

- (IBAction)dismissButtonPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
