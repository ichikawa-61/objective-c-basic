//
//  ViewController.h
//  2-4-1
//
//  Created by Manami Ichikawa on 3/15/17.
//  Copyright © 2017 Manami Ichikawa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

//- (NSMutableArray *)getWeather;
//@property (strong, nonatomic) NSString *dateLabel;
//@property (strong, nonatomic) NSString *telop;
//@property (strong, nonatomic) NSString *imageUrl;

//
//@property NSMutableArray *weatherTest;
@property (strong, nonatomic) NSString   *city;
@property (strong, nonatomic) NSString   *discription;
- (IBAction)getWeather:(id)sender;
@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end

