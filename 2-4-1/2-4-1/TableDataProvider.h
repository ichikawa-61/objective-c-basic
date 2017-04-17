//
//  WeatherTableView.h
//  2-4-1
//
//  Created by Manami Ichikawa on 3/28/17.
//  Copyright © 2017 Manami Ichikawa. All rights reserved.



#import <UIKit/UIKit.h>



@interface TableDataProvider : NSObject<UITableViewDataSource,UITableViewDelegate>


-(void)setUpTableView:(NSArray*)lists;
@property(strong,nonatomic) NSArray *items;
@end
