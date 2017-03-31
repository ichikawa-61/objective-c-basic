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
    
    NSString *date  = weather.dateLabel;
    NSString *telop = weather.telop;
    NSString *icon  = weather.imageUrl;
    x = 1+x;
    

    
        FMDatabase* db = [self getConnection];
        [db open];
    
        NSString *sql = @"UPDATE t_weather SET weather_telop = ?, weather_date = ?, weather_icon = ? WHERE weather_id = ?";
   
    [db executeUpdate:sql,telop,date,icon,[NSNumber numberWithInteger:x]];
    
    
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
    
    return [FMDatabase databaseWithPath:self.db_path];
    
};





@end
