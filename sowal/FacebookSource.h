//
//  FacebookSource.h
//  sowal
//
//  Created by Midge 't Hoen on 15-02-13.
//  Copyright (c) 2013 Midge 't Hoen. All rights reserved.
//

#import "SWSource.h"
#import <FacebookSDK/FacebookSDK.h>


@interface FacebookSource : SWSource <FBLoginViewDelegate, FBViewControllerDelegate>
{
//    FBSession *session;
    NSMutableArray *content;
}
@end
