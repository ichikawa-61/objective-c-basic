//
//  ViewController.h
//  UIDatePikerView
//
//  Created by Manami Ichikawa on 3/3/17.
//  Copyright © 2017 Manami Ichikawa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIView *myView;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIDatePicker *datepicker;
- (IBAction)changeDate:(id)sender;

@end

