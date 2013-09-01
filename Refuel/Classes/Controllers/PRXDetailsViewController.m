//
//  PRXDetailsViewController.m
//  Refuel
//
//  Created by Matthias Eder on 8/31/13.
//  Copyright (c) 2013 Matthias Eder. All rights reserved.
//

#import "PRXDetailsViewController.h"
#import "UIColor+Custom.h"
#import <QuartzCore/QuartzCore.h>

@interface PRXDetailsViewController ()
@property (weak, nonatomic) IBOutlet UIToolbar *toolbar;
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

    NSMutableArray *toolbarItems = [NSMutableArray new];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0 , 0.0f, self.view.frame.size.width, 21.0f)];
    [titleLabel setFont:[UIFont boldSystemFontOfSize:16.0]];
    [titleLabel setBackgroundColor:[UIColor clearColor]];
    [titleLabel setTextColor:[UIColor rflMediumBlueColor]];
    [titleLabel setText:@"Station Details"];
    
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


- (IBAction)dismissButtonPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
