//
//  ViewController.h
//  2-4-1
//
//  Created by Manami Ichikawa on 3/15/17.
//  Copyright © 2017 Manami Ichikawa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeatherService.h"

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,APIgetWeatherDelegte>//@property (weak,nonatomic) id <APIgetWeatherDelegte>delegate;

//-(void)getWeatherInfo;
//- (NSMutableArray *)getWeather;
//@property (strong, nonatomic) NSString *dateLabel;
//@property (strong, nonatomic) NSString *telop;
//@property (strong, nonatomic) NSString *imageUrl;
//@property (weak,nonatomic) id<APIgetWeatherDelegte> delegate;

//@property NSMutableArray *weatherTest;

- (IBAction)getWeather:(id)sender;
@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end

