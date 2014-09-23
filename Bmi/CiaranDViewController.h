//
//  CiaranDViewController.h
//  Bmi
//
//  Created by Ciaran Downey on 9/22/14.
//  Copyright (c) 2014 Ciaran Downey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CiaranDViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *heightTextField;
@property (weak, nonatomic) IBOutlet UITextField *weightTextField;

@property (weak, nonatomic) IBOutlet UILabel *bmiCategoryLabel;
@property (weak, nonatomic) IBOutlet UILabel *bmiResultLabel;

@property (weak, nonatomic) IBOutlet UILabel *heightUnitLabel;
@property (weak, nonatomic) IBOutlet UILabel *weightUnitLabel;

@property (weak, nonatomic) IBOutlet UILabel *metricLabel;

@property (weak, nonatomic) IBOutlet UIImageView *bmiCategoryImageView;

@property (nonatomic) BOOL isMetric;

@property (strong, nonatomic) NSNumberFormatter *formatter;

// current number
@property (readonly) NSNumber* weightNumber;
@property (readonly) NSNumber* heightNumber;

// metric units
@property (readonly) NSNumber* weightInKg;
@property (readonly) NSNumber* heightInCms;
@property (readonly) NSNumber* heightInM;

// US units
@property (readonly) NSNumber* heightInInches;
@property (readonly) NSNumber* weightInLbs;

- (IBAction)didToggleMetricSwitch:(UISwitch *)sender;

- (IBAction)didPressCalculateButton:(UIButton *)sender;

- (NSNumber*) roundNumber:(NSNumber*)num;

@end
