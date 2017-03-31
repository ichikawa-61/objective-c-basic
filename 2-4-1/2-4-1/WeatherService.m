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
static NSString* const _url = @"http://weather.livedoor.com/forecast/webservice/json/v1?city=130010";



-(void)getWeatherInfo{
    NSMutableArray *weatherData = [[NSMutableArray alloc] initWithCapacity:0];

        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager GET:_url
      parameters:nil
         success:^(NSURLSessionDataTask *  task, id   responseObject) {
             
             
             
             for (NSDictionary<NSString *, NSString *> *forecasts in responseObject[@"forecasts"]) {
                 Weather *weather = [[Weather alloc] init];
                 
                 weather.dateLabel = forecasts[@"dateLabel"];
                 weather.telop = forecasts[@"telop"];
                 weather.imageUrl = [forecasts valueForKeyPath:@"image.url"];
                 [weatherData addObject:weather];
                 
                 
        //-------------------------------------------------
        //    通信を受けとたら、データベースに入れるためのメソッド
        //-------------------------------------------------
               ManageData *data = [[ManageData alloc]init];
                 [data addInfo:weather];
                 
                 
              }
             
         } failure:^(NSURLSessionDataTask *  task, NSError *  error) {
             NSLog(@"%@", error);
             
         }];
    [self.delegate finishGettingInfo];
  
}








@end
