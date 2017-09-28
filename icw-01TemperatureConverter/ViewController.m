//
//  ViewController.m
//  icw-01TemperatureConverter
//
//  Created by user on 9/27/17.
//  Copyright © 2017 user. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *sgmSelector;
@property (weak, nonatomic) IBOutlet UILabel *baseLbl;
@property (weak, nonatomic) IBOutlet UILabel *firstConversionLbl;
@property (weak, nonatomic) IBOutlet UILabel *secondConversionLbl;
@property (weak, nonatomic) IBOutlet UILabel *firstResultLbl;
@property (weak, nonatomic) IBOutlet UILabel *secondResultLbl;
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UILabel *lblMin;
@property (weak, nonatomic) IBOutlet UILabel *lblMax;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self sgmSelectorChange:NULL];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)sgmSelectorChange:(id)sender {
    
    if(self.sgmSelector.selectedSegmentIndex == 0){
        self.baseLbl.textAlignment = NSTextAlignmentLeft;
        self.firstConversionLbl.text = @"Fahrenheit to Celsius";
        self.secondConversionLbl.text = @"Fahrenheit to Kelvin";
        self.slider.maximumValue = 212;
        self.slider.minimumValue = 32;
    }
    if(self.sgmSelector.selectedSegmentIndex == 1){
        self.baseLbl.textAlignment = NSTextAlignmentCenter;
        self.firstConversionLbl.text = @"Celsius to Fahrenheit";
        self.secondConversionLbl.text = @"Celsius to Kelvin";
        self.slider.maximumValue = 100;
        self.slider.minimumValue = 0;
        

    }
    if(self.sgmSelector.selectedSegmentIndex == 2){
        self.baseLbl.textAlignment = NSTextAlignmentRight;
        self.firstConversionLbl.text = @"Kelvin to Fahrenheit";
        self.secondConversionLbl.text = @"Kelvin to Celsius";
        self.slider.maximumValue = 373.2;
        self.slider.minimumValue = 273.15;

    }
    self.slider.value = ((self.slider.maximumValue - self.slider.minimumValue) /2) + self.slider.minimumValue;
    self.baseLbl.text = [NSString stringWithFormat:@"%.2f",self.slider.value];
    self.lblMin.text = [NSString stringWithFormat:@"%.2f",self.slider.minimumValue];
    self.lblMax.text = [NSString stringWithFormat:@"%.2f",self.slider.maximumValue];
    [self changeSlider:NULL];
}
- (IBAction)changeSlider:(id)sender {
    
    self.baseLbl.text = [NSString stringWithFormat: @"%.2f", self.slider.value];
    double value = self.slider.value;
    if(self.sgmSelector.selectedSegmentIndex == 0){
        double result = ((value - 32) * 5/9);
        NSMutableString *resultString = [NSMutableString stringWithFormat:@"%.2f", result];
        self.firstResultLbl.text = resultString;
        double secondResult = ((value - 32) * 5/9 + 273.15);
        resultString = [NSMutableString stringWithFormat:@"%.2f", secondResult];
        self.secondResultLbl.text = resultString;
    }
    if(self.sgmSelector.selectedSegmentIndex == 1){
        double result = ((value * 9/5) + 32);
        NSMutableString *resultString = [NSMutableString stringWithFormat:@"%.2f", result];
        self.firstResultLbl.text = resultString;
        double secondResult = (value + 273.15);
        resultString = [NSMutableString stringWithFormat:@"%.2f", secondResult];
        self.secondResultLbl.text = resultString;
    }
    if(self.sgmSelector.selectedSegmentIndex == 2){
        double result = ((value - 273.15) * 9/5 + 32);
        NSMutableString *resultString = [NSMutableString stringWithFormat:@"%.2f", result];
        self.firstResultLbl.text = resultString;
        double secondResult = (value - 273.15);
        resultString = [NSMutableString stringWithFormat:@"%.2f", secondResult];
        self.secondResultLbl.text = resultString;
    }
}


@end
