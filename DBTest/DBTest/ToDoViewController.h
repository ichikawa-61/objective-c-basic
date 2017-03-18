//
//  ViewController.h
//  DBTest
//
//  Created by Manami Ichikawa on 3/13/17.
//  Copyright © 2017 Manami Ichikawa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TodoViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

- (NSMutableArray *)selectTitle:(NSMutableArray *)array;
- (IBAction)goToResister:(id)sender;

@end

