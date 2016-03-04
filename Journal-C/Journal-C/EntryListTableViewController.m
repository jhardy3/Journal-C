//
//  EntryListTableViewController.m
//  Journal-C
//
//  Created by Jake Hardy on 3/3/16.
//  Copyright © 2016 Jake Hardy. All rights reserved.
//

#import "EntryListTableViewController.h"
#import "EntryController.h"
#import "EntryDetailViewController.h"

@interface EntryListTableViewController ()

@end

@implementation EntryListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[EntryController sharedInstance].entries count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"entryCell" forIndexPath:indexPath];
    
    Entry *entry = [EntryController sharedInstance].entries[indexPath.row];
    
    cell.textLabel.text = entry.title;
    cell.detailTextLabel.text = entry.text;
    
    return cell;
}

// Add Delete functionality
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    EntryDetailViewController *entryDetailView = segue.destinationViewController;
    entryDetailView.delegate = self;
    if ([segue.identifier isEqualToString:@"toNewEntry"]) {
        printf("itWorked NewEntry!");
        
    } else if ([segue.identifier isEqualToString:@"toExistingEntry"]) {
        NSIndexPath *index = [self.tableView indexPathForSelectedRow];
        Entry *entry = [EntryController sharedInstance].entries[index.row];
        [entryDetailView updateWithEntry:entry];
    }
}


@end
