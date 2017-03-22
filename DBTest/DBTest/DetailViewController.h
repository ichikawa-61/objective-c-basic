//
//  DetailViewController.h
//  DBTest
//
//  Created by Manami Ichikawa on 3/21/17.
//  Copyright © 2017 Manami Ichikawa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *changeTitle;
@property NSString *test;

//rootViewから値を受け取るためのプロパティ
@property NSString  *de_title;
@property NSString  *de_date;
@property NSString  *de_contens;
@property NSInteger  de_id;

@property (weak, nonatomic) IBOutlet UITextField *detailTitle;
@property (weak, nonatomic) IBOutlet UITextField *detailDate;
@property (weak, nonatomic) IBOutlet UITextView *detailContents;
- (IBAction)modifyTodo:(id)sender;
- (void)okButtonPushed;

@end
