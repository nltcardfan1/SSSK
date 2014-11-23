//
//  NLTIE370ViewController.m
//  SSSK
//
//  Created by Nathan Thomas on 6/11/14.
//  Copyright (c) 2014 Nathan Thomas. All rights reserved.
//

#import "NLTIE370ViewController.h"

@interface NLTIE370ViewController ()

@end

@implementation NLTIE370ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        // Create a UIImage from a file
        // This will use Hypno@2x on retina display devices
        UIImage *image = [UIImage imageNamed:@"calculator.png"];
        
        // Put that image on the tab bar item
        self.tabBarItem.image = image;
        self.tabBarItem.title = @"Factor Calculator";
    }
    return self;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    //NSLog(@"text field returned");
    return YES;
}

-(IBAction)sliderValueChanged:(id)sender
{
    
 if (sender == _periodSlider) {
     
        int sliderValue;
        sliderValue = lroundf(_periodSlider.value);
        [_periodSlider setValue:sliderValue animated:YES];
        [_periodStepper setValue:_periodSlider.value];
        _sliderLabel.text = [NSString stringWithFormat:@"%.0f", _periodSlider.value];
        //NSLog(@"%f@",_periodSlider.value);
    }
    
}

- (IBAction)clearResult:(id)sender {
    _Result.text = @"";
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    // allow backspace
    if (!string.length)
    {
        return YES;
    }
    
    if ([textField.text rangeOfString:@"."].location == NSNotFound)
           {
               if ([string isEqualToString:@"."]) {
                  return YES;
               }
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

-(IBAction)FgivenP:(id)sender
{

    float result;
    result = ([_valueTextBox.text floatValue]*powf(1+([_interestPercent.text floatValue])/100, [_sliderLabel.text floatValue]));
    [self populateResult:result];
   
    
}

- (IBAction)PgivenF:(id)sender
{
    float result;
    result =([_valueTextBox.text floatValue])*powf(1+([_interestPercent.text floatValue])/100,(-[_sliderLabel.text floatValue]));
    [self populateResult:result];
    //NSLog(@"P given F");
}

- (IBAction)FgivenA:(id)sender {
    
    float result;
    result = [_valueTextBox.text floatValue]*(
        ((powf(1+(([_interestPercent.text floatValue])/100),[_sliderLabel.text floatValue]))-1)
     /
        (([_interestPercent.text floatValue])/100));
    [self populateResult:result];
}

- (IBAction)AgivenF:(id)sender {
    float interest =[_interestPercent.text floatValue]/100;
    float inputValue = [_valueTextBox.text floatValue];
    float power = powf((1+interest),[_sliderLabel.text floatValue]);
    float result =inputValue*(interest/((power)-1));
    [self populateResult:result];
}

- (IBAction)pGivenA:(id)sender {
    float interest =[_interestPercent.text floatValue]/100;
    float inputValue = [_valueTextBox.text floatValue];
    float power = powf((1+interest),[_sliderLabel.text floatValue]);
    float result = inputValue*((power-1)/(interest*power));
    [self populateResult:result];
}

- (IBAction)AgivenP:(id)sender {
    float interest =[_interestPercent.text floatValue]/100;
    float inputValue = [_valueTextBox.text floatValue];
    float power = powf((1+interest),[_sliderLabel.text floatValue]);
    float result = inputValue*((power*interest)/(power-1));
    [self populateResult:result];
}


- (IBAction)stepperValueChanged:(UIStepper*)sender {
    [_periodSlider setValue:sender.value];
    _sliderLabel.text = [NSString stringWithFormat:@"%.0f", _periodSlider.value];

}

-(void)populateResult:(float)result
{
    _Result.text = [NSString stringWithFormat:@"$%.2f", result];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //set app delegates
    [_interestPercent setDelegate:self];
    [_valueTextBox setDelegate:self];

    
    _sliderLabel.text = [NSString stringWithFormat:@"%.0f", _periodSlider.value];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}



@end
