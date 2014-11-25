//
//  SWSourceTableViewCell.h
//  sowal
//
//  Created by Midge 't Hoen on 15-02-13.
//  Copyright (c) 2013 Midge 't Hoen. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SWSource;

@interface SWSourceTableViewCell : UITableViewCell{
    SWSource *_source;
}

@property (nonatomic, retain) SWSource *source;
@property (weak, readwrite) IBOutlet UIImageView *logoImageView;
@property (weak, readwrite) IBOutlet UILabel *statusLabel;



@end
