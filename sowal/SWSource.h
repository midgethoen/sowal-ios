//
//  SWSource.h
//  sowal
//
//  Created by Midge 't Hoen on 15-02-13.
//  Copyright (c) 2013 Midge 't Hoen. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SWSourceViewController;
@protocol SWSourceContentRefreshDelegate;

@interface SWSource : NSObject {

    @protected
    SWSourceViewController *_viewController;
    __weak UIImage *logoImage;
    BOOL isRefreshingContent;
}

@property (readonly, weak) UIImage *logo;
@property (readonly) UIColor *color;
@property (readonly) NSString *statusDescription;
@property (nonatomic, readonly) NSArray *content;
@property (readonly) BOOL isAvailable;
@property (nonatomic, weak) id <SWSourceContentRefreshDelegate> delegate;
@property (readonly) BOOL isRefreshingContent;


-(UIViewController *)configure;
-(void)refreshContent;

//-(NSMutableArray *)availableContentClasses;
//-(NSArray *)content;
//-(void)setFilter:(NSObject *)filter;
//-(SWSourceViewController *)viewcontroller;

@end

@protocol SWSourceContentRefreshDelegate <NSObject>
-(void)sourceDidRefreshContent:(SWSource *)source;
@end
