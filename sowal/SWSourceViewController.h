//
//  SWSourceViewController.h
//  sowal
//
//  Created by Midge 't Hoen on 15-02-13.
//  Copyright (c) 2013 Midge 't Hoen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SWSourceViewController : UIViewController {
    __weak IBOutlet UIImageView *_logoImageView;
    UITableViewCell *_tableViewCell;
}

-(UITableViewCell *)tableViewCell;

- (IBAction)loginButtonPressed;
@end
