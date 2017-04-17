//
//  WeatherService.m
//  2-4-1
//
//  Created by Manami Ichikawa on 3/24/17.
//  Copyright © 2017 Manami Ichikawa. All rights reserved.
//

#import "WeatherService.h"
#import "Weather.h"
#import "ManageData.h"
#import <AFNetworking/AFNetworking.h>


@implementation WeatherService

@synthesize weatherDatas;
@synthesize delegate;
static NSString* const _url = @"http://weather.livedoor.com/forecast/webservice/json/v1";



-(void)getWeatherInfo{
    NSMutableArray *weatherData = [[NSMutableArray alloc] initWithCapacity:0];

        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
        [manager GET:_url
          parameters:@{@"city" : @"130010"}
             success:^(NSURLSessionDataTask *  task, id   responseObject) {
                 
                 

                 int count = 0;
                 
                 for (NSDictionary<NSString *, NSString *> *forecasts in
                     responseObject[@"forecasts"]) {
                     count++;
                     Weather *weather = [[Weather alloc] init];
                     
                     weather.dateLabel = forecasts[@"dateLabel"];
                     weather.telop = forecasts[@"telop"];
                     weather.imageUrl = [forecasts valueForKeyPath:@"image.url"];
                     weather.weatherDay = [self getWeatherDay: count];
                     [weatherData addObject:weather];
                     
            //-------------------------------------------------
            //    通信を受けとたら、データベースに入れるためのメソッド
            //-------------------------------------------------
                     ManageData *data = [[ManageData alloc]init];
                     [data addInfo:weather];
                     
                     
                  }
                 
                  [self.delegate finishGettingInfo];
                 
             } failure:^(NSURLSessionDataTask *  task, NSError *  error) {
                 NSLog(@"%@", error);
                 
                
             }
    ];
   
  
}

- (WeatherDay)getWeatherDay: (int)count {
    
    switch (count) {
        case Today:
            return  Today;
        case Tomorrow:
            return Tomorrow;
        case DayAfterTomorrow:
            return DayAfterTomorrow;
        default:
            return Today;
    }
}






@end
