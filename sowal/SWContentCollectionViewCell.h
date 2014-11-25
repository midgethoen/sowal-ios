//
//  SWContentCollectionViewCell.h
//  sowal
//
//  Created by Midge 't Hoen on 16-02-13.
//  Copyright (c) 2013 Midge 't Hoen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SWContentCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UILabel *contentViewTextLabel;
@property (weak, nonatomic) IBOutlet UIImageView *contentViewImageView;


@end
