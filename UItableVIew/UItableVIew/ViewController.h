//
//  ViewController.h
//  UItableVIew
//
//  Created by Manami Ichikawa on 3/7/17.
//  Copyright © 2017 Manami Ichikawa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

