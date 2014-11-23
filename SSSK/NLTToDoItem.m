//
//  NLTToDoItem.m
//  SSSK
//
//  Created by Nathan Thomas on 7/3/14.
//  Copyright (c) 2014 Nathan Thomas. All rights reserved.
//

#import "NLTToDoItem.h"

@implementation NLTToDoItem

- (instancetype)initWithItemName:(NSString *)name;
{
    self = [super init];
    if(self)
        self.title = name;
    return self;
}
+ (instancetype)itemWithName:(NSString*)name;
{
    NLTToDoItem *newListItem = [[self alloc]initWithItemName:name];
    return newListItem;
}




@end
