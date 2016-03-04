//
//  Entry.h
//  Journal-C
//
//  Created by Jake Hardy on 3/3/16.
//  Copyright © 2016 Jake Hardy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Entry : NSObject



@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSString *date;

- (instancetype)initWithTitle:(NSString *)title text:(NSString *)text;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

- (NSDictionary *)entryToDictionary;


@end
