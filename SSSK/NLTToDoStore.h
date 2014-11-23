//
//  NLTToDoStore.h
//  SSSK
//
//  Created by Nathan Thomas on 7/3/14.
//  Copyright (c) 2014 Nathan Thomas. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NLTToDoItem.h"

@interface NLTToDoStore : NSObject

@property (nonatomic, readonly) NSArray *allItems;

// Notice that this is a class method and prefixed with a + instead of a -
+ (instancetype)sharedStore;
- (NLTToDoItem *)createItemWithTitle:(NSString*)title;
- (void)removeItem:(NLTToDoItem *)item;
@end
