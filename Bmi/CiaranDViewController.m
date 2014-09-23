//
//  CiaranDViewController.m
//  Bmi
//
//  Created by Ciaran Downey on 9/22/14.
//  Copyright (c) 2014 Ciaran Downey. All rights reserved.
//

#import "CiaranDViewController.h"

#define CONVERT_KG_TO_LB 2.205
#define CONVERT_LB_TO_KG 0.454
#define CONVERT_IN_TO_CM 2.54
#define CONVERT_CM_TO_IN 0.394

@implementation CiaranDViewController

@synthesize bmiCategoryImageView;
@synthesize bmiCategoryLabel;
@synthesize bmiResultLabel;

@synthesize heightUnitLabel;
@synthesize weightUnitLabel;
@synthesize metricLabel;

@synthesize heightTextField;
@synthesize weightTextField;

@synthesize isMetric;
@synthesize formatter;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    [self initFormatter];

    self.isMetric = NO;

    self.bmiCategoryImageView.image = [UIImage imageNamed:@"8_8_pizza"];
    self.bmiResultLabel.lineBreakMode = NSLineBreakByWordWrapping;
}

- (void) initFormatter {
    if (self.formatter == nil) {
        self.formatter = [[NSNumberFormatter alloc] init];
    }

    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    [formatter setRoundingMode:NSNumberFormatterRoundDown];
    [formatter setMinimum:@0];
    [formatter setMaximumFractionDigits:0];
    [formatter setAlwaysShowsDecimalSeparator:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)didToggleMetricSwitch:(UISwitch *)sender {
    // get the old values
    NSNumber *newWeight;
    NSNumber *newHeight;

    if (self.isMetric) {
        newWeight = self.weightInLbs;
        newHeight = self.heightInInches;
    } else {
        newWeight = self.weightInKg;
        newHeight = self.heightInCm;
    }

    self.isMetric = !self.isMetric;

    [self updateUnitLabels];

    heightTextField.text = [newHeight stringValue];
    weightTextField.text = [newWeight stringValue];
}

- (void) updateUnitLabels {
    if (self.isMetric) {
        heightUnitLabel.text = @"cm";
        weightUnitLabel.text = @"kg";
        metricLabel.text     = @"Metric";
    } else {
        heightUnitLabel.text = @"inches";
        weightUnitLabel.text = @"lbs";
        metricLabel.text     = @"US";
    }
}

- (IBAction)didPressCalculateButton:(UIButton *)sender {
    NSNumber* heightObj = self.heightInM;
    NSNumber* weightObj = self.weightInKg;

    if (heightObj == nil || weightObj == nil) {
        return;
    }

    float height = heightObj.floatValue;
    float weight = weightObj.floatValue;

    if (height == 0 || weight == 0) {
        return;
    }

    float bmi = weight / (height * height);

    bmiResultLabel.text = [NSString stringWithFormat:@"%.2f", bmi];

    NSString* msg;
    NSString* img;

    if (bmi < 16) {
        msg = @"Severe Thinness";
        img = @"8_8_pizza";
    } else if (bmi < 16.99) {
        msg = @"Moderate Thinness";
        img = @"7_8_pizza";
    } else if (bmi < 18.49) {
        msg = @"Mild Thinness";
        img = @"6_8_pizza";
    } else if (bmi < 24.99) {
        msg = @"Normal Range";
        img = @"4_8_pizza";
    } else if (bmi < 29.99) {
        msg = @"Overweight";
        img = @"3_8_pizza";
    } else if (bmi < 34.99) {
        msg = @"Obese Class I (Moderate)";
        img = @"2_8_pizza";
    } else if (bmi < 39.99) {
        msg = @"Obese Class II (Severe)";
        img = @"1_8_pizza";
    } else {
        msg = @"Obese Class III (Very Severe)";
        img = @"0_8_pizza";
    }

    bmiCategoryLabel.text = msg;
    bmiCategoryImageView.image = [UIImage imageNamed:img];
}

- (NSNumber*) heightInM {
    return [NSNumber numberWithFloat:(self.heightInCm.floatValue / 100)];
}

- (NSNumber*) heightInCm {
    if (self.isMetric) {
        return [self roundNumber:self.heightNumber];
    }

    return [self roundNumber:[NSNumber numberWithFloat:([self.heightNumber floatValue] * CONVERT_IN_TO_CM)] ];
}

- (NSNumber*) weightInKg {
    if (self.isMetric) {
        return [self roundNumber:self.weightNumber];
    }

    return [self roundNumber:[NSNumber numberWithFloat:([self.weightNumber floatValue] * CONVERT_LB_TO_KG)]];
}

- (NSNumber*) weightInLbs {
    if (!self.isMetric) {
        return [self roundNumber:self.weightNumber];
    }

    return [self roundNumber:[NSNumber numberWithFloat:([self.weightNumber floatValue] * CONVERT_KG_TO_LB)]];

}

- (NSNumber*) heightInInches {
    if (!self.isMetric) {
        return [self roundNumber:self.heightNumber];
    }

    return [self roundNumber:[NSNumber numberWithFloat:([self.heightNumber floatValue] * CONVERT_CM_TO_IN)]];
}

- (NSNumber*) weightNumber {
    return [formatter numberFromString:[weightTextField text]];
}

- (NSNumber*) heightNumber {
    return [formatter numberFromString:[heightTextField text]];
}

- (NSNumber*) roundNumber:(NSNumber*)num {
    return [NSNumber numberWithInt:(int)round(num.floatValue)];
}
@end
