//
//  ResisterToDoViewController.h
//  DBTest
//
//  Created by Manami Ichikawa on 3/14/17.
//  Copyright © 2017 Manami Ichikawa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ResisterToDoViewController : UIViewController
- (IBAction)saveTask:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *titleTx;
@property (weak, nonatomic) IBOutlet UILabel *dateTx;

- (IBAction)goBack:(id)sender;

@property (weak, nonatomic) IBOutlet UITextView *contents;
@property (weak, nonatomic) IBOutlet UIDatePicker *setDate;

- (IBAction)dateChanged:(id)sender;
- (void)yesButtonPushed;


@end

