//
//  NLTAddToDoViewController.m
//  SSSK
//
//  Created by Nathan Thomas on 7/13/14.
//  Copyright (c) 2014 Nathan Thomas. All rights reserved.
//

#import "NLTAddToDoViewController.h"
#import "NLTToDoStore.h"
#import "NLTToDoTableViewController.h"

@interface NLTAddToDoViewController ()

@property (nonatomic, strong) IBOutlet UITextField *toDoField;
@end

@implementation NLTAddToDoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(saveAction)];

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [_toDoField setDelegate:self];
    
}

-(void)saveAction
{
    if(![self.toDoField.text isEqualToString:@""])
    {
        [self dismissViewControllerAnimated:YES completion:nil];
    
        if([self.delegate respondsToSelector:@selector(addItemToList:)])
            {
                [self.delegate addItemToList:_toDoField.text];
            }
    
    [[self navigationController] popViewControllerAnimated:YES];
    }
    
    else {
        
    }

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
  
    
    return YES;

}

@end
