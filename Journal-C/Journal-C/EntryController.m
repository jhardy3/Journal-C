//
//  EntryController.m
//  Journal-C
//
//  Created by Jake Hardy on 3/3/16.
//  Copyright © 2016 Jake Hardy. All rights reserved.
//

#import "EntryController.h"
#import "Entry.h"

@implementation EntryController

static NSString * const NSBaseKey = @"Base";

-(void)addEntry:(Entry *)entry {
    [self.entries addObject:entry];
    [self saveToPersistenStorage];
}

-(void)removeEntry:(Entry *)entry {
    [self.entries removeObject:entry];
    [self saveToPersistenStorage];
    
}

+ (EntryController *)sharedInstance
{
    static EntryController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [EntryController new];
        sharedInstance.entries = [NSMutableArray alloc];
        [sharedInstance loadFromPersistenStorage];
    });
    return sharedInstance;
}

- (void)saveToPersistenStorage {
    NSMutableArray *entryDictionaries = [NSMutableArray new];
    
    for (Entry *entry in self.entries) {
        [entryDictionaries addObject:entry.entryToDictionary];
    }
    
    [[NSUserDefaults standardUserDefaults] setObject:entryDictionaries forKey:NSBaseKey];
}

- (void)loadFromPersistenStorage {
    
    NSMutableArray *entriesNew = [NSMutableArray new];
    
    NSArray *entryDictionaries = [[NSUserDefaults standardUserDefaults] objectForKey:NSBaseKey];
    
    for (NSDictionary *entryDictionary in entryDictionaries) {
        Entry *entry = [[Entry alloc] initWithDictionary: entryDictionary];
        [entriesNew addObject:entry];
    }
    self.entries = entriesNew;
}


@end
