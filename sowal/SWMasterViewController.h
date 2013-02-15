//
//  SWMasterViewController.h
//  sowal
//
//  Created by Midge 't Hoen on 15-02-13.
//  Copyright (c) 2013 Midge 't Hoen. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SWDetailViewController;

@interface SWMasterViewController : UITableViewController

@property (strong, nonatomic) SWDetailViewController *detailViewController;

@end
