//
//  ManageData.h
//  2-4-1
//
//  Created by Manami Ichikawa on 3/27/17.
//  Copyright © 2017 Manami Ichikawa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDB.h"
#import "Weather.h"

@interface ManageData : NSObject

@property(nonatomic,copy) NSString* db_path;

-(FMDatabase*)getConnection;
+(NSString*)getDbFilePath;
-(void)addInfo:(Weather*)weather;
-(NSArray*)weatherList;


    
@end
