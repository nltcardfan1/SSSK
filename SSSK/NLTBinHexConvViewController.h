//
//  NLTBinHexConvViewController.h
//  SSSK
//
//  Created by Nathan Thomas on 7/15/14.
//  Copyright (c) 2014 Nathan Thomas. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NLTBinHexConvViewController : UIViewController <UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *decInput;
@property (strong, nonatomic) IBOutlet UILabel *binLbl;
@property (strong, nonatomic) IBOutlet UILabel *hexLbl;

@end
