//
//  SWContent.h
//  sowal
//
//  Created by Midge 't Hoen on 15-02-13.
//  Copyright (c) 2013 Midge 't Hoen. All rights reserved.
//

#import "SWSource.h"
@class SWContentCollectionViewCell;

@interface SWContent : SWSource

-(SWContentCollectionViewCell *)collectionViewCellForCollectionView:(UICollectionView *)collectionView atIndexPath:(NSIndexPath *)indexPath;

@end
