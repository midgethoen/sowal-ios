//
//  SWMainViewController.h
//  sowal
//
//  Created by Midge 't Hoen on 15-02-13.
//  Copyright (c) 2013 Midge 't Hoen. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SWSourceManager;

@interface SWMainViewController : UICollectionViewController <UICollectionViewDelegate, UITableViewDataSource, UIPopoverControllerDelegate>{
    SWSourceManager *sourceManager;
}

@property (nonatomic, retain) UIPopoverController *popoverController;

-(void)showSettings:(UIBarButtonItem *)sender;

@end
