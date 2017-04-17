//
//  WeatherService.h
//  2-4-1
//
//  Created by Manami Ichikawa on 3/24/17.
//  Copyright © 2017 Manami Ichikawa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Weather.h"
#import "FMDB.h"

@protocol APIGetWeatherDelegte<NSObject>

@optional

-(void)finishGettingInfo;

@end


@interface WeatherService : NSObject
@property (weak,nonatomic)id delegate;
@property(nonatomic, strong) NSMutableArray* weatherDatas;

-(void)getWeatherInfo;

typedef NS_ENUM(NSInteger, WeatherDay){
    
    Today=1,
    Tomorrow,
    DayAfterTomorrow
    
};


@end
