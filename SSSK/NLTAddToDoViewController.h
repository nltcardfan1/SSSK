//
//  NLTAddToDoViewController.h
//  SSSK
//
//  Created by Nathan Thomas on 7/13/14.
//  Copyright (c) 2014 Nathan Thomas. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol NLTAddToDoViewDelegate <NSObject>;

-(void) addItemToList:(NSString *)title;

@end

@interface NLTAddToDoViewController : UIViewController <UITextFieldDelegate>

@property (unsafe_unretained) id <NLTAddToDoViewDelegate> delegate;
- (void)saveAction;

@end
