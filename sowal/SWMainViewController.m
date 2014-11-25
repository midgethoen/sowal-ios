//
//  SWMainViewController.m
//  sowal
//
//  Created by Midge 't Hoen on 15-02-13.
//  Copyright (c) 2013 Midge 't Hoen. All rights reserved.
//

#import "SWMainViewController.h"
#import "SWSourceManager.h"
#import "SWSourceTableViewCell.h"
#import "SWSettingsViewController.h"
#import "SWContentCollectionViewCell.h"
#import "SWContent.h"

@interface SWMainViewController ()

@end

@implementation SWMainViewController
@synthesize popoverController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        sourceManager = [SWSourceManager sharedSourceManager];
    }
    return self;
}

-(void)dealloc{
    [sourceManager removeObserver:self forKeyPath:@"content"];
}

- (void)loadView
{
    [super loadView];
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"SWContentCollectionViewCell" bundle:nil]
          forCellWithReuseIdentifier:@"contentcollectionviewcell"];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"settings" style:UIBarButtonItemStyleBordered target:self action:@selector(showSettings:)];
    self.title = @"Sowal";
    
    [sourceManager addObserver:self forKeyPath:@"content" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)showSettings:(UIBarButtonItem *)sender{
    if (!self.popoverController){
        //create settings controller
        SWSettingsViewController *settingsController = [[SWSettingsViewController alloc] initWithStyle:UITableViewStyleGrouped];
        
        //display according to platform
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad){
            self.popoverController = [[UIPopoverController alloc] initWithContentViewController:settingsController];
            self.popoverController.delegate = self;
            [self.popoverController presentPopoverFromBarButtonItem:sender permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
        } else {
            [self.navigationController pushViewController:settingsController animated:YES];
        }
    }
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    if (object == sourceManager && [keyPath isEqualToString:@"content"]){
        [self.collectionView reloadData];
    }
}

-(void)popoverControllerDidDismissPopover:(UIPopoverController *)popoverController{
    self.popoverController = nil;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [[sourceManager content] count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    SWContent *content = [[sourceManager content] objectAtIndex:indexPath.item];
    return [content collectionViewCellForCollectionView:collectionView atIndexPath:indexPath];
}

@end
