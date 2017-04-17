//
//  ViewController.h
//  2-4-1
//
//  Created by Manami Ichikawa on 3/15/17.
//  Copyright © 2017 Manami Ichikawa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeatherService.h"


//@protocol showTableView



//@end


@interface ViewController : UIViewController<APIGetWeatherDelegte>

//-(void)setUpTableView:(NSArray*)lists;

- (IBAction)getWeather:(id)sender;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak,nonatomic)id delegate;

@end

