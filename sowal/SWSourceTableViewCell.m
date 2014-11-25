//
//  SWSourceTableViewCell.m
//  sowal
//
//  Created by Midge 't Hoen on 15-02-13.
//  Copyright (c) 2013 Midge 't Hoen. All rights reserved.
//

#import "SWSourceTableViewCell.h"
#import "SWSource.h"

@implementation SWSourceTableViewCell

//- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
//{
//    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
//    if (self) {
//        // Initialization code
//    }
//    return self;
//}
//
//- (void)setSelected:(BOOL)selected animated:(BOOL)animated
//{
//    [super setSelected:selected animated:animated];
//
//    // Configure the view for the selected state
//}

-(void)setSource:(SWSource *)source{
    _source = source;
    self.imageView.image = source.logo;
    self.textLabel.text = source.statusDescription;
    self.contentView.backgroundColor = source.color;
}

@end
