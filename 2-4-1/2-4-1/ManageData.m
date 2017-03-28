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
    NSLog(@"いいいいいいい");
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
    
    //データを入れる時コメントアウト
    
        FMDatabase* db = [self getConnection];
        [db open];
    
        NSString *sql = @"INSERT INTO t_weather (weather_telop, weather_date, weather_icon) VALUES (?,?,?)";
    
        [db executeUpdate:sql,telop,date,icon];
    
    
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
    //NSLog(@"%@",self.db_path);
    return [FMDatabase databaseWithPath:self.db_path];
    
};





@end
