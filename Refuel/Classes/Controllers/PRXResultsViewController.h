//
//  PRXResultsViewController.h
//  Refuel
//
//  Created by Matthias Eder on 8/25/13.
//  Copyright (c) 2013 Matthias Eder. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PRXResultsViewController : UIViewController
    <UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) NSArray *results;
@end
