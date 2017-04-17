//
//  ManageData.m
//  2-4-1
//
//  Created by Manami Ichikawa on 3/27/17.
//  Copyright © 2017 Manami Ichikawa. All rights reserved.
//

#import "ManageData.h"
#import "WeatherService.h"

@implementation ManageData
NSInteger x = 0;

-(id)init{
    
    self = [super init];
    if(self){
        FMDatabase* db = [self getConnection];
        [db open];
        NSString *sql = @"CREATE TABLE IF NOT EXISTS  t_weather(weather_id INTEGER PRIMARY KEY AUTOINCREMENT, weather_telop TEXT, weather_date DATE, weather_icon TEXT); ";
        [db executeUpdate:sql];
        [db close];
    }
    return self;
}



-(NSArray*)weatherList{
    
    FMDatabase *db = [self getConnection];
    NSString *sqlite = @"SELECT* FROM t_weather ";
    [db open];
    FMResultSet* results = [db executeQuery:sqlite];
    NSMutableArray* list = [[NSMutableArray alloc]init];
    
    while([results next]){
        
        Weather *weather = [[Weather alloc]init];
        weather.telop    = [results stringForColumn:@"weather_telop"];
        weather.dateLabel     = [results stringForColumn:@"weather_date"];
        weather.imageUrl = [results stringForColumn:@"weather_icon"];
        
        [list addObject:weather];
        
        
    }
    [db close];
    
    return list;
}

-(void)addInfo:(Weather*)weather{
    
    NSString *date       = weather.dateLabel;
    NSString *telop      = weather.telop;
    NSString *icon       = weather.imageUrl;
    NSInteger weatherDay = weather.weatherDay;
    
    
   
    

    
    FMDatabase* db = [self getConnection];
    [db open];
    [db beginTransaction];
    

    NSString *sql = @"INSERT OR REPLACE INTO t_weather (weather_id, weather_telop, weather_date, weather_icon) VALUES (?,?,?,?)";
   
    [db executeUpdate:sql,[NSNumber numberWithInteger:weatherDay],telop,date,icon];
    [db commit];
    
    [db close];
    
    
        
    
}

+(NSString*)getDbFilePath{
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask,YES);
    NSString *dir = [paths
                     objectAtIndex:0];
    return [dir stringByAppendingPathComponent:@"weather.db"];
    
    
}


-(FMDatabase*)getConnection{
    if(self.db_path == nil){
        self.db_path = [ManageData getDbFilePath];
    }
    
    NSLog(@"%@",_db_path);
    
    return [FMDatabase databaseWithPath:self.db_path];
    
};





@end
