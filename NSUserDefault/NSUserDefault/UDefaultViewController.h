//
//  ViewController.h
//  NSUserDefault
//
//  Created by Manami Ichikawa on 3/13/17.
//  Copyright © 2017 Manami Ichikawa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UDefaultViewController : UIViewController


@property (weak, nonatomic) IBOutlet UILabel *doubleLabel;

@property (weak, nonatomic) IBOutlet UILabel *intLabel;
@property (weak, nonatomic) IBOutlet UILabel *stringLabel;
@property (weak, nonatomic) IBOutlet UITextField *doubleTx;

@property (weak, nonatomic) IBOutlet UITextField *intTx;
@property (weak, nonatomic) IBOutlet UITextField *stringTx;
- (IBAction)changeDouble:(id)sender;
- (IBAction)changeInt:(id)sender;
- (IBAction)changeString:(id)sender;

@end

