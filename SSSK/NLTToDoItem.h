//
//  NLTToDoItem.h
//  SSSK
//
//  Created by Nathan Thomas on 7/3/14.
//  Copyright (c) 2014 Nathan Thomas. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NLTToDoItem : NSObject <NSCoding>


@property(nonatomic,strong) NSString *title;

- (instancetype)initWithItemName:(NSString *)name;
+ (instancetype)itemWithName:(NSString*)name;


@end
