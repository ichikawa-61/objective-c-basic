//
//  WeatherService.h
//  2-4-1
//
//  Created by Manami Ichikawa on 3/24/17.
//  Copyright © 2017 Manami Ichikawa. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "ViewController.h"
#import "Weather.h"
#import "FMDB.h"

@protocol APIgetWeatherDelegte<NSObject>

@optional

-(void)finishGettingInfo;

@end


@interface WeatherService : NSObject
//@property(strong, nonatomic)ViewController* api;
//@property (strong, nonatomic) ViewController *viewController;
@property (weak,nonatomic)id delegate;
@property(nonatomic, strong) NSMutableArray* weatherDatas;
//@property(strong, nonatomic)ViewController *viewController;

-(void)getWeatherInfo;

@end
