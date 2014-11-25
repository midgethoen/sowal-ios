//
//  FacebookSource.m
//  sowal
//
//  Created by Midge 't Hoen on 15-02-13.
//  Copyright (c) 2013 Midge 't Hoen. All rights reserved.
//

#import "FacebookSource.h"
#import "SWAppDelegate.h"

#import "SWFBTaggedContent.h"

@interface FacebookSource ()
-(NSArray *)permissions;

@end
@implementation FacebookSource

-(id)init{
    if (self = [super init]){
        [FBSession openActiveSessionWithAllowLoginUI:NO];
    }
    return self;
}

-(UIImage *)logo{
    if (!logoImage)
        logoImage = [UIImage imageNamed:@"f_logo.png"];
    return logoImage;
}

-(UIColor *)color{
    return [UIColor colorWithRed:.93f
                           green:.94f
                            blue:.96f
                           alpha:1.0f];
}

-(NSString *)statusDescription{    
    if (FBSession.activeSession.isOpen) {
        return NSLocalizedString(@"active", @"fb status");
    }else {
        return NSLocalizedString(@"inactive", @"login action");
    }
}

-(NSArray *)permissions{
        return @[
                    //user data permission
    //                    @"email",
    //                    @"publish_actions",
    //                    @"user_about_me",
    //                    @"user_actions.music",
    //                    @"user_actions.news",
    //                    @"user_actions.video",
    //                    @"user_activities",
    //                    @"user_birthday",
    //                    @"user_education_history",
    //                    @"user_events",
    //                    @"user_games_activity",
    //                    @"user_groups",
    //                    @"user_hometown",
    //                    @"user_interests",
    //                    @"user_likes",
    //                    @"user_location",
    //                    @"user_notes",
    //                    @"user_photos",
    //                    @"user_questions",
    //                    @"user_relationship_details",
    //                    @"user_relationships",
    //                    @"user_religion_politics",
    //                    @"user_status",
    //                    @"user_subscriptions",
    //                    @"user_videos",
    //                    @"user_website",
    //                    @"user_work_history",
                   
                    //friends data permissions
                    
                    //extended data permissions
                    @"read_stream"];
}

-(UIViewController *)configure{
    if (FBSession.activeSession.isOpen){
        [FBSession.activeSession closeAndClearTokenInformation];
        FBSession.activeSession = nil;
    } else {
        [FBSession openActiveSessionWithReadPermissions:[self permissions] allowLoginUI:YES completionHandler:^(FBSession *session, FBSessionState status, NSError *error) {
            NSLog(@"%@ %i %@", session, status, error);
        }];
    }
    return nil;
}

-(BOOL)isAvailable{
    return (FBSession.activeSession.isOpen);
}

-(void)refreshContent{
    if (self.isRefreshingContent) return;    
    FBRequest *request = [[FBRequest alloc] initWithSession:FBSession.activeSession graphPath:@"/me/tagged"];
    isRefreshingContent = YES;
    [request startWithCompletionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
        content = [NSMutableArray array];
        NSAssert([result isKindOfClass:[NSDictionary class]], @"the resulting object is not an array");
        for (NSDictionary *tagDict in (NSArray *)[(NSDictionary *)result objectForKey:@"data"]) {
            SWFBTaggedContent *tag = [[SWFBTaggedContent alloc] init];
            tag.from    = [[tagDict objectForKey:@"from"] objectForKey:@"name"];
            tag.message = [tagDict objectForKey:@"message"];
            [content addObject:tag];
        }
        isRefreshingContent = NO;
        if (self.delegate) [self.delegate sourceDidRefreshContent:self];
    }];
}

-(NSArray *)content{
    if (!content)
        return [NSArray array];
    else
        return content;
}



@end
