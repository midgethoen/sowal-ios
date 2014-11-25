//
//  TwitterSource.m
//  sowal
//
//  Created by Midge 't Hoen on 16-02-13.
//  Copyright (c) 2013 Midge 't Hoen. All rights reserved.
//

#import "TwitterSource.h"

@implementation TwitterSource

-(UIImage *)logo{
    if (!logoImage)
        logoImage = [UIImage imageNamed:@"t_logo.png"];
    return logoImage;
}

-(UIColor *)color{
    return [UIColor colorWithRed:.93f
                           green:.94f
                            blue:.96f
                           alpha:1.0f];
}



-(NSString *)statusDescription{
    return [super statusDescription];
}


-(UIViewController *)configure{
    ACAccountStore *store = [[ACAccountStore alloc] init];
    ACAccountType *type = [store accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierTwitter];
    [store requestAccessToAccountsWithType:type options:nil completion:^(BOOL granted, NSError *error){

    }];
    
    return nil;
}


@end
