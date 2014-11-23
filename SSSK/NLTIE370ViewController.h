//
//  NLTIE370ViewController.h
//  SSSK
//
//  Created by Nathan Thomas on 6/11/14.
//  Copyright (c) 2014 Nathan Thomas. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NLTIE370ViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *interestPercent;
@property (weak, nonatomic) IBOutlet UITextField *valueTextBox;

@property (weak, nonatomic) IBOutlet UISlider *periodSlider;
@property (weak, nonatomic) IBOutlet UILabel *sliderLabel;
@property (weak, nonatomic) IBOutlet UIStepper *periodStepper;

- (IBAction)FgivenP:(id)sender;
- (IBAction)PgivenF:(id)sender;
- (IBAction)FgivenA:(id)sender;
- (IBAction)AgivenF:(id)sender;
- (IBAction)pGivenA:(id)sender;
- (IBAction)AgivenP:(id)sender;
- (IBAction)stepperValueChanged:(UIStepper*)sender;
- (IBAction)sliderValueChanged:(id)sender;
- (IBAction)clearResult:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *Result;

-(void)populateResult: (float)result;


@end
