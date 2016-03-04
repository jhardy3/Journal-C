//
//  EntryDetailViewController.m
//  Journal-C
//
//  Created by Jake Hardy on 3/3/16.
//  Copyright © 2016 Jake Hardy. All rights reserved.
//

#import "EntryDetailViewController.h"
#import "EntryController.h"
#import "Entry.h"
#import "EntryListTableViewController.h"

@interface EntryDetailViewController ()

// Outlets
@property (weak, nonatomic) IBOutlet UITextView *journalBodyText;
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (strong, nonatomic) Entry *entry;


@end

@implementation EntryDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self updateViewWithEntry];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateWithEntry:(Entry *)entry {
    self.entry = entry;
}

- (void)updateViewWithEntry {
    if (self.entry != nil) {
        self.journalBodyText.text = self.entry.text;
        self.titleTextField.text = self.entry.title;
    }
}

- (IBAction)clearButtonTapped:(UIButton *)sender {
    self.journalBodyText.text = @"";
    self.titleTextField.text = @"";
}

- (IBAction)saveButtonTapped:(UIBarButtonItem *)sender {
    // Save shiz here; check if entry is empty for some reason.
    
    if (self.entry != nil) {
        
    } else {
        Entry *entry = [[Entry alloc] initWithTitle:self.titleTextField.text text:self.journalBodyText.text];
        [[EntryController sharedInstance] addEntry:entry];
        [self.delegate.tableView reloadData];
    }
    
    [self.navigationController popViewControllerAnimated:true];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self resignFirstResponder];
    return true;
}

@end
