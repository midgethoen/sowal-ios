//
//  SWSettingsViewController.m
//  sowal
//
//  Created by Midge 't Hoen on 16-02-13.
//  Copyright (c) 2013 Midge 't Hoen. All rights reserved.
//

#import "SWSettingsViewController.h"
#import "SWSourceTableViewCell.h"
#import "SWSourceManager.h"
#import "SWSource.h"

@interface SWSettingsViewController ()
-(void)outputChanged:(UISegmentedControl *)segmentedControl;
@end

@implementation SWSettingsViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2; //sources
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return NSLocalizedString(@"Sources", @"Social sources settings header text");
            break;
            
        case 1:
            return NSLocalizedString(@"Output", @"output settings header text");
            break;
            
        default:
            return @"kak";
            break;
    }
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return [[[SWSourceManager sharedSourceManager] sources] count];
            break;
        
        case 1:
            return 1;
            
        default:
            return 0;
            break;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell;
    switch (indexPath.section) {
        case 0:
        {
            static NSString *sourcesIdentifier = @"sourcecell";
            
            //deque or create a tableviewcell
            SWSourceTableViewCell *swcell = [tableView dequeueReusableCellWithIdentifier:sourcesIdentifier];
            if (!swcell){
                swcell = [[[NSBundle mainBundle] loadNibNamed:@"SWSourceTableViewCell" owner:nil options:nil] objectAtIndex:0];
            }
            
            //configure the cell
            swcell.source = [[[SWSourceManager sharedSourceManager] sources] objectAtIndex:[indexPath row]];
            cell = swcell;
        }
            break;
        case 1:
        {
            static NSString *identifier = @"segmentedcontrolcell";
            
            //deque or create a tableviewcell
            cell = [tableView dequeueReusableCellWithIdentifier:identifier];
            if (!cell){
                cell = [[[NSBundle mainBundle] loadNibNamed:@"SWSegmentedControlCell" owner:nil options:nil] objectAtIndex:0];
            }
            
            //configure the cell
            UILabel *label = (UILabel *)[cell viewWithTag:1];
            UISegmentedControl *segmentedControl = (UISegmentedControl *)[cell viewWithTag:2];
            
            label.text = NSLocalizedString(@"Output:", @"");
            segmentedControl.selectedSegmentIndex = [[NSUserDefaults standardUserDefaults] integerForKey:@"output"];
            [segmentedControl addTarget:self action:@selector(outputChanged:) forControlEvents:UIControlEventValueChanged];
        }
            break;
        default:
            break;
    }
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case 0:
        {
             [tableView deselectRowAtIndexPath:indexPath animated:YES];
            
            SWSource *selectedSource = [[[SWSourceManager sharedSourceManager] sources] objectAtIndex:indexPath.row];
            UIViewController *sourceConfigViewController = [selectedSource configure];
           
        }
            break;
            
        default:
            [tableView deselectRowAtIndexPath:indexPath animated:NO];
            break;
    }
    
    
}

//TODO: notify displaymaneger thingy
-(void)outputChanged:(UISegmentedControl *)segmentedControl{
    [[NSUserDefaults standardUserDefaults] setInteger:segmentedControl.selectedSegmentIndex forKey:@"output"];
}

@end
