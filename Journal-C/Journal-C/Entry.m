//
//  Entry.m
//  Journal-C
//
//  Created by Jake Hardy on 3/3/16.
//  Copyright © 2016 Jake Hardy. All rights reserved.
//

#import "Entry.h"

@implementation Entry

static NSString * const TitleKey = @"title";
static NSString * const TextKey = @"text";
static NSString * const DateKey = @"date";

- (instancetype)initWithTitle:(NSString *)title text:(NSString *)text{
    self = [super init];
    if (self) {
        _text = text;
        _title = title;
        _date = @"date";
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        _text = dictionary[TextKey];
        _title = dictionary[TitleKey];
        _date = dictionary[DateKey];
    }
    return self;
}

- (NSDictionary *)entryToDictionary {
    return @{
             TitleKey : self.title,
             TextKey : self.text,
             DateKey : self.date
             };
}

@end
