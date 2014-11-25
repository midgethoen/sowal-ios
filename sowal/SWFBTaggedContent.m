//
//  SWFBTaggedContent.m
//  sowal
//
//  Created by Midge 't Hoen on 16-02-13.
//  Copyright (c) 2013 Midge 't Hoen. All rights reserved.
//

#import "SWFBTaggedContent.h"
#import "SWContentCollectionViewCell.h"

@implementation SWFBTaggedContent

-(SWContentCollectionViewCell *)collectionViewCellForCollectionView:(UICollectionView *)collectionView atIndexPath:(NSIndexPath *)indexPath{
    SWContentCollectionViewCell *cell = [super collectionViewCellForCollectionView:collectionView atIndexPath:indexPath];
    
    cell.contentViewTextLabel.text = self.message;
    cell.label.text = self.from;
    
    return cell;
}

@end
