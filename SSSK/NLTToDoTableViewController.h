//
//  NLTToDoTableViewController.h
//  SSSK
//
//  Created by Nathan Thomas on 7/3/14.
//  Copyright (c) 2014 Nathan Thomas. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NLTAddToDoViewController.h"

@interface NLTToDoTableViewController : UITableViewController <NLTAddToDoViewDelegate>

- (void)addItemToList:(NSString *) title;

@end
