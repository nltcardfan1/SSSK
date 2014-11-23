//
//  NLTToDoStore.m
//  SSSK
//
//  Created by Nathan Thomas on 7/3/14.
//  Copyright (c) 2014 Nathan Thomas. All rights reserved.
//

#import "NLTToDoStore.h"
#import "NLTToDoItem.h"

@interface NLTToDoStore ()

@property (nonatomic) NSMutableArray *privateItems;

@end

@implementation NLTToDoStore


+ (instancetype)sharedStore
{
    static NLTToDoStore *sharedStore;
    
    // Do I need to create a sharedStore?
    if (!sharedStore) {
        sharedStore = [[self alloc] initPrivate];
    }
    
    return sharedStore;
}

// If a programmer calls [[BNRItemStore alloc] init], let him
// know the error of his ways
- (instancetype)init
{
    @throw [NSException exceptionWithName:@"Singleton"
                                   reason:@"Use +[NLTToDoStore sharedStore]"
                                 userInfo:nil];
    return nil;
}

// Here is the real (secret) initializer
- (instancetype)initPrivate
{
    self = [super init];
    if (self) {
        _privateItems = [[NSMutableArray alloc] init];
    }
    return self;
}

- (NLTToDoItem *)createItemWithTitle:(NSString *)title
{
    NLTToDoItem *item = [NLTToDoItem itemWithName:title];
    
    [self.privateItems addObject:item];
    
    return item;
}

- (NSArray *)allItems
{
    return [self.privateItems copy];
}

- (void)removeItem:(NLTToDoItem *)item
{
    [self.privateItems removeObjectIdenticalTo:item];
}

@end
