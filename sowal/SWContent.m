//
//  SWContent.m
//  sowal
//
//  Created by Midge 't Hoen on 15-02-13.
//  Copyright (c) 2013 Midge 't Hoen. All rights reserved.
//

#import "SWContent.h"
#import "SWContentCollectionViewCell.h"

@implementation SWContent

-(SWContentCollectionViewCell *)collectionViewCellForCollectionView:(UICollectionView *)collectionView atIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"contentcollectionviewcell";
    SWContentCollectionViewCell *collectionViewCell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    if (!collectionViewCell) {
        collectionViewCell = [[[NSBundle mainBundle] loadNibNamed:@"SWContentCollectionViewCell" owner:nil options:nil] objectAtIndex:0];
    }
    return collectionViewCell;
}

@end
