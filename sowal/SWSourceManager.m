//
//  SWSourceManager.m
//  sowal
//
//  Created by Midge 't Hoen on 15-02-13.
//  Copyright (c) 2013 Midge 't Hoen. All rights reserved.
//

#import "SWSourceManager.h"

#import "FacebookSource.h"
#import "TwitterSource.h"
#import "SWSourceTableViewCell.h"

@interface SWSourceManager ()
-(void)update;
@end

@implementation SWSourceManager
@synthesize sources=_sources, content=_content;

static SWSourceManager *sharedSourceManager = nil;

+(SWSourceManager *)sharedSourceManager{
    if (!sharedSourceManager){
        sharedSourceManager = [[SWSourceManager alloc] init];
    }
    return sharedSourceManager;
}

-(id)init{
    if (self = [super init]){
        
        //update content every so often
//        NSInvocation *invocation = [[NSInvocation alloc] init];
//        invocation.target   = self;
//        invocation.selector = @selector(update);
        refreshTimer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(update) userInfo:nil repeats:YES];
    }
    return self;
}

//make al sources update
-(void)update{
    for (SWSource *source in self.sources)
        if (source.isAvailable)
            [source refreshContent];
}


-(NSArray *)sources{
    if (!_sources){
        _sources = [NSMutableArray array];
        for (Class sourceClass in @[[FacebookSource class]/*, [TwitterSource class]*/]) {
            SWSource *source = [[sourceClass alloc] init];
            source.delegate = self;
            [_sources addObject:source];
        }
    }
    return _sources;
}

-(NSArray *)content{
    if (!_content) return [NSArray array];
    else return _content;
}

-(void)sourceDidRefreshContent:(SWSource *)source{
    [self willChangeValueForKey:@"content"];
    NSMutableArray *content = [NSMutableArray array];
    
    for (SWSource *source in self.sources)
        if (source.isAvailable)
            [content addObjectsFromArray:[source content]];
    
    _content = content;
    
    //make sure that classes registerred for changes recieve notifications 
    [self didChangeValueForKey:@"content"];
}

@end
