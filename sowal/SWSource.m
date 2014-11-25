//
//  SWSource.m
//  sowal
//
//  Created by Midge 't Hoen on 15-02-13.
//  Copyright (c) 2013 Midge 't Hoen. All rights reserved.
//

#import "SWSource.h"
#import "SWSourceViewController.h"

@implementation SWSource
@synthesize isRefreshingContent;

-(SWSourceViewController *)viewcontroller{
    if (!_viewController)
        _viewController = [[SWSourceViewController alloc] init];
    return _viewController;
}

-(UIImage *)logo{
    return  nil;
}

-(UIColor *)color{
    return [UIColor redColor];
}

-(NSString *)statusDescription{
    return @"implement";
}

-(UIViewController *)configure{
    NSAssert(NO, @"%s is meant to be overridden", __FUNCTION__);
    return nil;
}

-(BOOL)isAvailable{
    NSAssert(NO, @"%s is meant to be overridden", __FUNCTION__);
    return NO;
}

-(NSArray *)content{
    NSAssert(NO, @"%s is meant to be overridden", __FUNCTION__);
    return nil;
}

-(void)refreshContent{
    NSAssert(NO, @"%s is meant to be overridden", __FUNCTION__);
}

@end
