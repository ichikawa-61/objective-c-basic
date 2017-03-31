//
//  WeatherTableView.h
//  2-4-1
//
//  Created by Manami Ichikawa on 3/28/17.
//  Copyright © 2017 Manami Ichikawa. All rights reserved.



#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface TableDataProvider : NSObject<UITableViewDataSource,UITableViewDelegate,showTableView>



@property(strong,nonatomic) NSArray *item;
@end
