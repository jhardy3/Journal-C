//
//  EntryDetailViewController.h
//  Journal-C
//
//  Created by Jake Hardy on 3/3/16.
//  Copyright © 2016 Jake Hardy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Entry.h"
#import "EntryListTableViewController.h"

@interface EntryDetailViewController<UITextFieldDelegate> : UIViewController

- (void)updateWithEntry:(Entry *)entry;
@property (strong, nonatomic) EntryListTableViewController *delegate;

@end
