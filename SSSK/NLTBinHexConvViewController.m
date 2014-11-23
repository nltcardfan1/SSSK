//
//  NLTBinHexConvViewController.m
//  SSSK
//
//  Created by Nathan Thomas on 7/15/14.
//  Copyright (c) 2014 Nathan Thomas. All rights reserved.
//

#import "NLTBinHexConvViewController.h"

@interface NLTBinHexConvViewController ()

@end

@implementation NLTBinHexConvViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Create a UIImage from a file
        // This will use Hypno@2x on retina display devices
        UIImage *image = [UIImage imageNamed:@"informatics-32.png"];
        
        // Put that image on the tab bar item
        self.tabBarItem.image = image;
        self.tabBarItem.title = @"Binary Hex Converter";
        
        
        //NSString *binaryRepresentation = [NLTBinHexConvViewController decToBinary:33];
        //int five = 50;
        //NSLog(@"%@", binaryRepresentation);
        //NSLog(@"%x", five);
        //NSLog(@"%lu",five);
        
        
    }
    return self;
}

+(NSString *)decToBinary:(NSUInteger)decInt
{
    NSString *string = @"" ;
    NSUInteger x = decInt;
    
    int i = 0;
    while (x>0) {
        string = [[NSString stringWithFormat: @"%lu", x&1] stringByAppendingString:string];
        x = x >> 1;
        ++i;
    }
    return string;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    // allow backspace
    if (!string.length)
    {
        return YES;
    }
    
    // Prevent invalid character input, if keyboard is numberpad
    if (textField.keyboardType == UIKeyboardTypeNumberPad)
    {
        if ([string rangeOfCharacterFromSet:[[NSCharacterSet decimalDigitCharacterSet] invertedSet]].location != NSNotFound)
        {
            // BasicAlert(@"", @"This field accepts only numeric entries.");
            return NO;
        }
    }
    
    
    return YES;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    if(![_decInput.text  isEqual: @""])
    {
        NSString *binaryRepresentation = [NLTBinHexConvViewController decToBinary:[_decInput.text intValue]];
        NSString *hexRepresentation = [NSString stringWithFormat:@"%x", [_decInput.text intValue]];
        [_binLbl setText:binaryRepresentation];
        [_hexLbl setText:hexRepresentation];
        //NSLog(@"text field returned");
         //NSLog(@"%x", binaryRepresentation);
    }
    return YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [_decInput setDelegate:self];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
