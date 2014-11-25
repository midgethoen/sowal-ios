//
//  SWSourceManager.h
//  sowal
//
//  Created by Midge 't Hoen on 15-02-13.
//  Copyright (c) 2013 Midge 't Hoen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SWSource.h"


@interface SWSourceManager : NSObject <UITableViewDataSource, SWSourceContentRefreshDelegate> {
@protected
    NSMutableArray *_sources;
    NSMutableArray *_content;
    BOOL isRefreshingContent;
    NSTimer *refreshTimer;
}

@property (readonly) NSArray *content;
@property (readonly, retain) NSArray *sources;



+(SWSourceManager *)sharedSourceManager;

-(NSArray *)content;

@end
